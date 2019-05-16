#!/usr/bin/env python

#! MesaArmor 0.1, seedit for Android 
#! Copyright (C) 2019, The MesaArmor Authors.
#!
#! This program is free software; you can redistribute it and/or modify
#! it under the terms of the GNU General Public License as published by
#! the Free Software Foundation; either version 2 of the License, or
#! (at your option) any later version.
#!
#! This program is distributed in the hope that it will be useful,
#! but WITHOUT ANY WARRANTY; without even the implied warranty of
#! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#! GNU General Public License for more details.
#!
#! You should have received a copy of the GNU General Public License
#! along with this program; if not, write to the Free Software
#! Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

import sys
import os
import re
import logging
import subprocess
import pprint
import shutil

from xml.dom.minidom import parse, parseString
from libaudit2spdl import *
import libaudit2spdl
import pdb

path_aosp = "../../../../"
path_target = path_aosp + "out/target/"

path_sepolicy = path_aosp + "external/sepolicy/"
path_selinux = path_aosp + "external/selinux/"
path_seinfo = path_selinux+ "prebuilts/bin/seinfo.py"
path_sesearch = path_selinux + "prebuilts/bin/sesearch.py"
path_file_contexts = ""
path_property_contexts = ""
path_service_contexts = ""
path_genfs_contexts = path_sepolicy + "genfs_contexts"
path_recovery_init_rc = path_aosp + "bootable/recovery/etc/init.rc"
path_rootdir_init_rc = path_aosp + "system/core/rootdir/init.rc"
path_init_cpp = path_aosp + "system/core/init/init.cpp"

path_dontaudit_te = path_aosp + "external/mesaarmor/core/config/base_policy/dontaudit.te"
path_svcattribute_te = path_aosp + "external/mesaarmor/core/config/base_policy/svcattribute.te"

cur_sepolicy_path = ""

domdoc=readSPDLSpec(gSpecXML)

file_type_list = ["file", "dir", "lnk_file", "chr_file", "blk_file", "sock_file"]
domain_list = []
appdomain_list = []
skip_list = [
        'pipefs',
        'sockfs',
        'devpts',
        'tmpfs',
        'device',
        'mqueue',
        'proc_net',
        'qtaguid_proc',
        'proc_cpuinfo',
        'proc_sysrq',
        'proc_security',
        'proc_drop_caches',
        'proc_uid_cputime_showstat',
        'proc_uid_cputime_removeuid',
        'selinuxfs',
        'cgroup',
        'sysfs',
        'inotify',
        'pstorefs',
        'functionfs',
        'binfmt_miscfs',
        'debugfs',
        'labeledfs',
        'unlabeled',
        'appdomain',
        'netdomain',
        'bluetoothdomain',
        'exec_type',
        'sysfs_type',
        'sdcard_type',
        'app_data_file',
        'firmware_file',
        'drmserver_socket',
        'contextmount_type',
        'bluetooth_efs_file',
        'binderservicedomain',
        'system_app_data_file'
        ]

except_list = {
        'system_server': '',
        'system_app': '',
        'bluetooth': '',
        'nfc': '',
        'radio': '',
        'shared_relro': '',
        #shell?
        'isolated_app': '',
        'platform_app': '',
        'untrusted_app': '',
        #--------------------
        'adbd': '/sbin/adbd',
        'kernel': '',
        #TODO: vold may have blkid, fsck, blkid_untrusted, fsck_untrusted domains, may need to use change profile
        #http://aosp.opersys.com/xref/android-6.0.1_r77/xref/system/vold/main.cpp#147
        'fsck_untrusted': '',
        'blkid_untrusted': '',
        'hci_attach': '', #device specific
        'watchdogd': '/sbin/watchdogd',
        'recovery': '/sbin/recovery',
        'slideshow': '',
        'ueventd': '/sbin/ueventd',
        'healthd': '/sbin/healthd'
        }
aa_exec_dict = {}
aa_profile_dict = {}
aa_header_dict={}
aa_superdomain_dict = {}

perm_order={'r':0, 'w':1, 'a':2, 'l':3, 'k':4, 'm':5, 'rest':6}

# please refer to "Short form permissions map to" on https://gitlab.com/apparmor/apparmor/wikis/AppArmor_Core_Policy_Reference
# https://github.com/TresysTechnology/setools/blob/master/setools/perm_map

perm_map={
        'process': {
            'fork':'',
            'transition':'',
            'sigchld':'chld',
            'sigkill':'kill',
            'sigstop':'stop',
            'signull':'exists',
            'signal':'*',
            'ptrace':'',
            'getsched':'',
            'setsched':'',
            'getsession':'',
            'getpgid':'',
            'setpgid':'',
            'getcap':'',
            'setcap':'',
            'share':'',
            'getattr':'',
            'setexec':'',
            'setfscreate':'',
            'noatsecure':'',
            'siginh':'',
            'setrlimit':'',
            'rlimitinh':'',
            'dyntransition':'',
            'setcurrent':'',
            'execmem':'',
            'execstack':'',
            'execheap':'',
            'setkeycreate':'',
            'setsockcreate':''
            },
        'common_file':{
            'ioctl':'',
            'read':'r',
            'write':'w',
            'create':'w',
            'getattr':'r',
            'setattr':'w',
            'lock':'k',
            'relabelfrom':'',
            'relabelto':'',
            'append':'a',
            'unlink':'l',
            'link':'l',
            'rename':'w',
            'execute':'mix', #if it is not handled by type_transition, use mix
            'swapon':'',
            'quotaon':'',
            'mounton':'',
            },
        'dir':{
                'add_name':'w',
                'remove_name':'w',
                'reparent':'w',
                'search':'',
                'rmdir':'w',
                'open':'r',
                'audit_access':'',
                'execmod':''
                },
        'file':{
                'execute_no_trans':'',
                'entrypoint':'',
                'execmod':'',
                'open':'',
                'audit_access':''
                },
        'link_file':{
                'open':'',
                'audit_access':'',
                'execmod':''
                },
        'chr_file':{
                'execute_no_trans':'',
                'entrypoint':'',
                'execmod':'',
                'open':'',
                'audit_access':''
                },
        'blk_file':{
                'open':'',
                'audit_access':'',
                'execmod':''
                },
        'sock_file':{
                'open':'',
                'audit_access':'',
                'execmod':''
                },
        'fifo_file':{
                'open':'',
                'audit_access':'',
                'execmod':''
                },
        }

def strip_result(l, n):
    """remove first n item and remove space"""
    for i in range(n):
        del l[0]
    l = filter(None, l)
    return [x.strip() for x in l]

def split_rule(rule):
    try:
        rule_name = rule.split()[0]
    except IndexError:
        print "Index Error"
        print rule
        return []

    regex = '(?<=' + rule_name + '\s)' + '(\{\s(\w+\s)+\}|\w+)'
    source = re.search(regex, rule)
    target_type = re.search('(\{\s(\w+\s)+\}|\w+)(?=(:|\s:))', rule)
    target_category = re.search('(?<=:)(\s\{\s(\w+\s)+\}|\s\w+|\w+)', rule)
    perm = re.search('(\{\s(\w+\s)+\}|\w+|\w+\s"\w+")(?=(;|\s;))', rule)

    logging.debug(source.group())
    logging.debug(target_type.group())
    logging.debug(target_category.group())
    logging.debug(perm.group())

    return [rule_name.strip(), source.group().strip(), target_type.group().strip(), target_category.group().strip(), perm.group().strip()]

def add_rule2dict(aa_dict, domain, rule):
    if domain not in aa_dict:
        logging.error("Error: domain(" + domain + ") not in aa_dict, please check ")
        sys.exit()

    aa_dict[domain].append(rule)

def has_re(path):
    if any(ch in path for ch in ['*', '?', '^', '[', ']']):
        return True
    else:
        return False

def find_type(type_name, is_dir, is_aa_expansion):
    result = []
    filtered_result = []

    if type_name in ['cgroup','tmpfs']:
        return[]
    if type_name in ['sysfs_type','sysfs']:
        return ['/sys/**']

    for ln in open(path_file_contexts, 'r'):
        type_ln = re.search('(?<=u:object_r:)\w+(?=:s0)', ln)
        if type_ln is not None:
            logging.debug("type_ln")
            logging.debug(type_ln.group())
            if type_name == type_ln.group():
                result.append(ln.split()[0])

    for ln in open(path_rootdir_init_rc, 'r'):
        if type_name in ln and ln.lstrip().startswith("mount"):
            logging.debug(ln.split())
            result.append(ln.split()[3])

    for ln in open(path_recovery_init_rc, 'r'):
        if type_name in ln and ln.lstrip().startswith("mount"):
            logging.debug(ln.split())
            result.append(ln.split()[3])

    for ln in open(path_init_cpp, 'r'):
        if type_name in ln and ln.lstrip().startswith("mount"):
            logging.debug(re.split('[()\",;\s]+', ln.lstrip()))
            result.append(re.split('[()\",;\s]+', ln.lstrip())[2])

    for ln in open(path_genfs_contexts, 'r'):
        type_ln = re.search('(?<=u:object_r:)\w+(?=:s0)', ln)
        if type_ln is not None:
            if type_name == type_ln.group():
                if ln.split()[1] == 'proc':
                    result.append('/proc' + ln.split()[2])

    result = list(set(result))

    int_result = []
    for x in result:
        int_path = ""
        if x.endswith("(/.*)?"):
                #generate /path/**
                base_path = x[:x.find("(/.*)?")]
                int_path = base_path + "/**"
                #print "generate /**, directly repalce: before reg: " + x
                #print "after reg: " + base_path + "/**"

        else:
            int_path = x

        #directly output the path
        #int_result.append(x.replace("\+", "+").replace("\.", "."))
        int_result.append(int_path)

    return int_result

def aa_perm_order(perm):
    if perm in perm_order:
        return perm_order[perm]
    else:
        return perm_order['rest']

def construct_set(perm_list):
    result = set([])
    for x in perm_list:
        if x in perm_map['common_file']:
            if perm_map['common_file'][x] != '':
                result = result.union(set(list(perm_map['common_file'][x])))
    return result

def rm_dup_perm(perm_set):
    if 'w' in perm_set and 'a' in perm_set:
        perm_set.remove('a') # 'a' and 'w' are exclusive
    if 'i' in perm_set and 'p' in perm_set:
        perm_set.remove('i')
    return perm_set

def sort_perm_set(perm_set):
    dedup_perm_set = rm_dup_perm(perm_set)
    result_list = sorted(list(dedup_perm_set), key=aa_perm_order)
    return ','.join(result_list)

def dict_2d_add(d, x, y, entry):
    if x not in d:
        d[x] = {}
    if y not in d[x]:
        d[x][y] = []
    d[x][y].extend(entry)

def process_type_transition(target_exec, target_domain, path_dict, sdomain):
    global aa_exec_dict
    print "target: " + target_domain + ", sdomain: " + sdomain
    exec_list = find_type(target_exec, False, False)
    if len(exec_list):
        dict_2d_add(aa_exec_dict, target_domain, sdomain, exec_list)
    elif target_domain in except_list:
        dict_2d_add(aa_exec_dict, target_domain, sdomain, except_list[target_domain])
    else:
        print "Wrong: cannot find " + x

    return path_dict

def check_rule_format(rule):
    if rule.strip().split()[0] in ['allow', 'auditallow', 'neverallow', 'dontaudit', 'type_transition']:
        return True
    else:
        return False

def convert_path_list(path_list, is_dir):
    modified_path_list = []
    for x in path_list:
        if is_dir:
            modified_path_list.append()
        else:
            modified_path_list.append()

def process_transition(sdomain, target):
    global aa_exec_dict
    print "process_transition: sdomain: " + sdomain + ", target: " + target
    if target not in aa_exec_dict:
        aa_exec_dict[target] = {}
    if sdomain not in aa_exec_dict[target]:
        aa_exec_dict[target][sdomain] = []
        aa_exec_dict[target][sdomain].append("")

def parent_path(path):
    if path.endswith('/*'):
        return path[:-2]
    if path.endswith('/**'):
        return path[:-3]
    return path

def expand_attribute(target):
    result = []
    param_attr = "-a" + target
    result = subprocess.check_output([path_seinfo, cur_sepolicy_path, param_attr, "-x"]).splitlines()
    result = strip_result(result, 3)
    return result

def find_prop(type_name):
    result = []
    for ln in open(path_property_contexts, 'r'):
        prop_ln = re.search('(?<=u:object_r:)\w+(?=:s0)', ln)
        if prop_ln is not None:
            logging.debug("prop_ln")
            logging.debug(prop_ln.group())
            if type_name == prop_ln.group():
                result.append(ln.split()[0])
    return result

def find_service(type_name):
    result = []
    for ln in open(path_service_contexts, 'r'):
        svc_ln = re.search('(?<=u:object_r:)\w+(?=:s0)', ln)
        if svc_ln is not None:
            logging.debug("svc_ln")
            logging.debug(svc_ln.group())
            if type_name == svc_ln.group():
                result.append(ln.split()[0])
    return result

def make_label(path):
    return path\
            .replace("/","_")\
            .replace("+","p")\
            .replace(".","d")\
            .replace("-","m")\
            .replace(":","s")\
            .replace("[","l")\
            .replace("]","r")\
            .replace("^","e")\
            .replace("\\","b")\
            .replace("*","a")\
            .replace("(","z")\
            .replace(")","y")

# this is only for hammerhead qmux socket macro check
def is_qmux(splitted):
    rulename = splitted[0]
    source = splitted[1]
    target = splitted[2]
    cat = splitted[3]
    perm_list = re.findall('\w+', splitted[4])

    if source == 'qmux':
        return False
    #type $1_qmuxd_socket, file_type;
    #file_type_auto_trans($1, qmuxd_socket, $1_qmuxd_socket) ->
    #allow $1 $2:dir ra_dir_perms;
    ## Allow the domain to create the file.
    #allow $1 $3:notdevfile_class_set create_file_perms;
    #allow $1 $3:dir create_dir_perms;
    #type_transition $1 $2:dir $3;
    #type_transition $1 $2:notdevfile_class_set $3;
    #allow $1 qmuxd_socket:dir remove_name;
    if target == 'qmuxd_socket' or target.endswith('_qmuxd_socket'):
        return True
    #unix_socket_connect($1, qmuxd, qmux)->
    #allow $1 $2_socket:sock_file write;
    #allow $1 $3:unix_stream_socket connectto;
    if target == 'qmux' and cat == 'unix_stream_socket' and 'connectto' in perm_list:
        return True
    #allow qmux $1_qmuxd_socket:sock_file { getattr unlink };
    if rulename == 'allow' and source == 'qmux' and target.endswith('_qmuxd_socket') and cat == 'sock_file':
        return True

def process_rule(rule, mount_type, mount_dest, path_dict):
    if check_rule_format(rule) is False:
        return []

    global skip_list
    global domain_list
    global aa_exec_dict
    spRuleList = []
    rule_dict = dict()
    aa_rules = []
    splitted = split_rule(rule)

    if is_qmux(splitted):
        aa_rules.append("inline \"qmux_socket(" + splitted[1] +")\"")

    if splitted[0] == 'allow':
        aa_rule_name = ''
    elif splitted[0] == 'neverallow':
        aa_rule_name = 'deny '

    logging.debug(splitted)
    target = splitted[2]
    cat = splitted[3]
    perm_list = re.findall('\w+', splitted[4])

    rule_dict["domain"] = splitted[1]
    rule_dict["type"] = target
    rule_dict["secclass"] = cat
    rule_dict["permission"] = perm_list

    if splitted[0] == 'type_transition':
        if cat == 'process':
            #corresponding to domain_auto_trans
            process_type_transition(target, perm_list[0], path_dict, splitted[1])
        elif cat == 'file' and target.endswith('tmpfs'):
            aa_rules.append("allowtmp -fs tmpfs -name auto r,w;")
        else:
            #do we need new support of allowtmp -file ?
            aa_rules.append("inline \"" + rule + "\"")

    elif cat in file_type_list:
        permList = findFilePermission(domdoc,rule_dict,"allowfile")
        if not permList:
            permList = findFilePermission(domdoc,rule_dict,"allowdev")
        perm_set = set(permList)
        if cat == 'dir':
            path_list = find_type(target, True, True)
        else:
            path_list = find_type(target, False, True)
        if len(path_list):
            for x in path_list:
                if len(perm_set):
                    if x in path_dict:
                        path_dict[x] = path_dict[x].union(perm_set)
                    else:
                        path_dict[x] = perm_set

                    # we can remove this special case handler by labeling all exec with _exec (e.g., /sbin/adbd and /sbin/healthd)
                    if 'entrypoint' in perm_list:
                        if target.endswith('_exec') and splitted[1] in ['ueventd']:
                            entrypoint_rule = splitted[0] + ' ' + splitted[1] + ' f' + make_label(x) + ' : ' + splitted[3] + ' entrypoint;'
                            aa_rules.append("inline \"" + entrypoint_rule +"\"")
                        elif not target.endswith('_exec'):
                            entrypoint_rule = rule
                            aa_rules.append("inline \"" + entrypoint_rule +"\"")
                    if x.startswith('/dev/') and cat in ['chr_file', 'blk_file']:
                        aa_rules.append("allowdev -root /dev;")
        else:
            #cannot find path, use label directly
            if (perm_set) and not target.endswith('tmpfs') and target != 'kernel':
                if target in domain_list or target == 'domain' or target in skip_list or target == 'dev_type' or target.endswith('_device'):
                    aa_rules.append("inline \"" + rule + "\" #path_list: " + ','.join(path_list))
                else:
                    #TODO: need to debug. allow target perm; cannot generate selinux rule
                    #aa_rules.append("allow " + target + " " + sort_perm_set(perm_set) + "; #" + rule )
                    aa_rules.append("inline \"" + rule + "\"")
            elif not target.endswith('_tmpfs'):
                    aa_rules.append("inline \"" + rule + "\"")

        if target == 'tmpfs' or target == 'zygote_tmpfs':
            aa_rules.append("inline \"" + rule + "\"")

    elif cat in ['property_service']:
        prop_list = find_prop(target)
        for x in prop_list:
            aa_rules.append("allowprop " + x + " ;")
    elif cat in ['service_manager']:
        permList = findPermission(domdoc,rule_dict,"allowsvc")
        svc_list = find_service(target)
        if svc_list:
            for x in svc_list:
                aa_rules.append("allowsvc " + x + " " + ','.join(permList) + " ;");
        else:
            aa_rules.append("allowsvc -name " + target + " " + ','.join(permList) + " ;");
    elif cat in ['keystore_key']:
        permList = findPermission(domdoc,rule_dict,"allowks")
        aa_rules.append("allowks " + target + " " + ','.join(permList) + " ;");
    elif cat in ['drmservice']:
        aa_rules.append("allowdrm " + target + " ;");
    else:
        if cat == 'process' and 'transition' in perm_list:
            aa_rules.append("inline \"" + splitted[0] + ' ' + splitted[1] + ' ' + splitted[2] + ":process transition;\"")
        if cat == 'process' and 'dyntransition' in perm_list:
            if splitted[2] == 'appdomain':
                for x in appdomain_list:
                    dict_2d_add(aa_exec_dict, x, splitted[1], [])
            else:
                dict_2d_add(aa_exec_dict, splitted[2], splitted[1], [])

    spRuleList += genAllowpts(rule_dict, domdoc)

    if rule_dict["type"] in gFsLabelList or rule_dict["type"] in gDomainList:
        spRuleList += genAllowfs(rule_dict, domdoc)
    elif cat == 'binder':
        if target not in domain_list:
            target_expand_list = expand_attribute(target)
            for x in target_expand_list:
                rule_dict["type"] = x
                spRuleList += genAllowbinder(rule_dict, domdoc)
        else:
            spRuleList += genAllowbinder(rule_dict, domdoc)
    else:
        spRuleList += genAllownet(rule_dict, "", domdoc)
    spRuleList += genOther(rule_dict, domdoc)

    if spRuleList:
        for spRule in spRuleList:
            ruleStr=""
            ruletype=spRule["ruletype"]
            if ruletype=="allowfile":
                ruleStr = allowfileStr(spRule)

            elif ruletype=="allowfs":
                ruleStr = allowfsStr(spRule)

            elif ruletype=="allowcom":
                ruleStr= allowcomStr(spRule) + " #" + rule

            elif ruletype=="allownet":
                ruleStr = allownetStr(spRule)

            elif ruletype=="allowpriv":
                ruleStr = allowprivStr(spRule)
            elif ruletype in ("allowpts","allowtty"):
                ruleStr=allowTtyPtsStr(spRule)
            elif ruletype =="allowkey":
                ruleStr = allowkeyStr(spRule)
            elif ruletype =="allowbinder":
                ruleStr = allowbinderStr(spRule)

            aa_rules.append(ruleStr)

    return aa_rules

def process_rules(aa_dict, path_dict, domain, result):
    mount_type = {
            'mount': set([]),
            'remount': set([]),
            'umount': set([])}
    mount_dest = set([])
    result_list = strip_result(result.splitlines(), 0)
    for x in result_list:
        aa_dict[domain].extend(process_rule(x, mount_type, mount_dest, path_dict))

# add permissions from path_dict to aa_dict
def combine_path(aa_dict, path_dict, domain):
    for x in path_dict:
        if len(path_dict[x]):
            aa_dict[domain].append("allow " + x + " " + sort_perm_set(path_dict[x]) + ";")

def translate_rules(sepolicy_path, aa_dict, domain):
   # translate allow rule
    path_dict = {} # save all paths to remove duplication
    trans_result = subprocess.check_output([path_sesearch, sepolicy_path, "-T", "-s", domain, "-ds"])
    process_rules(aa_dict, path_dict, domain, trans_result)
    allow_result = subprocess.check_output([path_sesearch, sepolicy_path, "-A", "-s", domain, "-ds"])
    process_rules(aa_dict, path_dict, domain, allow_result)
    combine_path(aa_dict, path_dict, domain)

    # translate auditallow rule, has to corelate with allow rules, skip now

    # translate dontaudit rule
    dontaudit_result  = subprocess.check_output([path_sesearch, sepolicy_path, "--dontaudit"])
    with open(path_dontaudit_te, 'w') as f:
        for item in dontaudit_result:
            f.write("%s" % item)

def process_sepolicy(sepolicy_path, is_recovery):
    if is_recovery:
        print "process recovery sepolicy"
    else:
        print "process sepolicy"

    global aa_exec_dict
    aa_exec_dict = {}
    aa_profile_dict = {}
    aa_header_dict= {}
    attribute_set = set()
    aa_superdomain_dict = {}

    global cur_sepolicy_path
    cur_sepolicy_path = sepolicy_path

    # extract service related type attribute
    svc_result = subprocess.check_output([path_seinfo, sepolicy_path, "-a", "service_manager_type", "-x"])
    svc_list = strip_result(svc_result.splitlines(), 3)
    svc_typeattr_result = []
    for x in svc_list:
        #find service name
        svc_name_list = find_service(x)
        #find other service attribute
        svc_attr_result = subprocess.check_output([path_seinfo, sepolicy_path, "-t", x, "-x"])
        svc_attr_list = strip_result(svc_attr_result.splitlines(), 2)[0].replace(";","").replace(",","").split()
        svc_attr_list.remove("type")
        svc_attr_list.remove(x)
        svc_attr_list.remove("service_manager_type")
        for y in svc_name_list:
            for z in svc_attr_list:
                svc_typeattr_result.append("typeattribute s_" + make_label(y) + " " + z + ";\n")
    with open(path_svcattribute_te, 'w') as f:
        for item in svc_typeattr_result:
            f.write("%s" % item)

    # find all domains
    print "path_seinfo " + path_seinfo + "; sepolicy_path " + cur_sepolicy_path
    global domain_list
    global appdomain_list

    domain_list = expand_attribute("domain")
    appdomain_list = expand_attribute("appdomain")

    for x in domain_list:
        print "processing " + x
        aa_profile_dict[x] = []
        aa_superdomain_dict[x] = []
        attribute_list = subprocess.check_output([path_seinfo, cur_sepolicy_path, "-t" + x, "-x"]).splitlines()
        attribute_list = strip_result(attribute_list, 2)[0].replace(";","").replace(",","").split()
        print attribute_list
        attribute_list.remove('type')
        attribute_list.remove('domain')
        attribute_list.remove(x)
        aa_superdomain_dict[x] = set(attribute_list)
        if 'mlstrustedsubject' in attribute_list:
            print "remove mlstrustedsubject"
            attribute_list.remove('mlstrustedsubject')
        # save all attributes which is used by each domain, generate header files later
        attribute_set = attribute_set.union(set(attribute_list))

        translate_rules(cur_sepolicy_path, aa_profile_dict, x)

    pprint.pprint(aa_profile_dict)

    for x in attribute_set:
        print "processing attribute " + x
        aa_header_dict[x] = []
        translate_rules(cur_sepolicy_path, aa_header_dict, x)

    if is_recovery:
        generate_profiles(aa_exec_dict, aa_profile_dict, aa_header_dict, aa_superdomain_dict, './auto/recovery/root/')
    else:
        generate_profiles(aa_exec_dict, aa_profile_dict, aa_header_dict, aa_superdomain_dict, './auto/root/')


def generate_profiles(aa_exec_dict, aa_profile_dict, aa_header_dict, aa_superdomain_dict, path):
    path_include = path + "include/"

    if os.path.exists(path) == False:
        print path + " does not exist, create it"
        os.makedirs(path)

    if os.path.exists(path_include) == False:
        print path_include + "does not exist, create it"
        os.makedirs(path_include)

    for x in aa_header_dict:
        hF = open(path + x + ".sp", "w")
        hF.write("{\n");
        hF.write("superdomain " + x + ";\n");
        profile_list = list(set(aa_header_dict[x]))
        profile_list.sort()
        for y in profile_list:
            hF.write(y)
            hF.write("\n")
        hF.write("}\n\n");
        hF.close()

    for x in aa_profile_dict:
        pF = open(path + x + ".sp", "w")
        pF.write("{\n")
        if aa_superdomain_dict[x]:
            pF.write("domain_name " + x + " : " + ','.join(aa_superdomain_dict[x]) + ";\n")
        else:
            pF.write("domain_name " + x + ";\n")
        if x in aa_exec_dict:
            for y in aa_exec_dict[x]:
                if len(aa_exec_dict[x][y]):
                    for z in aa_exec_dict[x][y]:
                        pF.write("domain_trans " + y + " " + z + ";\n")
                else:
                    pF.write("domain_trans " + y + ";\n")

        profile_list = list(set(aa_profile_dict[x]))
        profile_list.sort()
        for y in profile_list:
            pF.write("  " + y + "\n")

        pF.write("}\n\n")
        pF.close()

def find_all(name, path):
    result = []
    for root, dirs, files in os.walk(path):
        if name in files:
            result.append(os.path.join(root, name))
    return result

if __name__ == "__main__":
    logging.basicConfig(stream=sys.stdout, level=logging.INFO)


    if len(sys.argv) == 1:
        print "Please provide device name. e.g.: ./sepol2sp.py hammerhead"
        sys.exit()
    path_target = path_target + "product/" + sys.argv[1]
    print "path_target is " + path_target

    path_backup = "./aosp"
    global path_file_contexts
    global path_property_contexts
    global path_service_contexts
    path_file_contexts = path_backup + "/file_contexts"
    path_property_contexts = path_backup + "/property_contexts"
    path_service_contexts = path_backup + "/service_contexts"
    path_sepolicy = path_backup + "/sepolicy"
    path_sepolicy_recovery = path_backup + "/sepolicy_recovery"
    if not os.path.exists(path_backup):
        #create backup aosp path
        os.makedirs(path_backup)

        #find and backup file_contexts, property_contexts, service_contexts, and sepolicy
        file_contexts_list = find_all("file_contexts", path_target)
        for x in file_contexts_list:
            if "root" in x and "recovery" not in x:
                print "copy file_contexts " + x
                shutil.copyfile(x, path_file_contexts)

        property_contexts_list = find_all("property_contexts", path_target)
        for x in property_contexts_list:
            if "root" in x and "recovery" not in x:
                print "copy property_contexts " + x
                shutil.copyfile(x, path_property_contexts)

        service_contexts_list = find_all("service_contexts", path_target)
        for x in service_contexts_list:
            if "root" in x and "recovery" not in x:
                print "copy service_contexts " + x
                shutil.copyfile(x, path_service_contexts)

        sepolicy_list = find_all("sepolicy", path_target)
        for x in sepolicy_list:
            if "root" in x:
                if "recovery" in x:
                    print "copy recovery sepolicy"
                    shutil.copyfile(x, path_sepolicy_recovery)
                else:
                    print "copy sepolicy"
                    shutil.copyfile(x, path_sepolicy)
    #converting sepolicy
    print "converting recovery sepolicy"
    process_sepolicy(path_sepolicy_recovery, True)
    print "converting sepolicy"
    process_sepolicy(path_sepolicy, False)

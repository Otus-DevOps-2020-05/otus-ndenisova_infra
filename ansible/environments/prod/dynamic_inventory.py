#!/usr/bin/env python

import argparse
import subprocess
import json

parser = argparse.ArgumentParser()
parser.add_argument('--list', action = 'store_true')
args = parser.parse_args()

if args.list:
    p = subprocess.Popen(["cd ../terraform/prod; terraform show | grep external_ip_address_app; cd -"], stdout=subprocess.PIPE, shell=True)
    appip=p.stdout.read().split('"')[1]

    p = subprocess.Popen(["cd ../terraform/prod; terraform show | grep external_ip_address_db; cd -"], stdout=subprocess.PIPE, shell=True)
    dbip=p.stdout.read().split('"')[1]

    dd = '{"_meta":{"hostvars":{"appserver":{"ansible_host":"%s"},"dbserver":{"ansible_host":"%s"}}}, "all":{"children":["ungrouped","app","db"],"hosts":[],"vars":{}},"app":{"hosts":["appserver"]},"db":{"hosts":["dbserver"]}}'%(appip,dbip)
    print json.dumps(json.loads(dd))

else:
    print json.dumps(json.loads('{"_meta": {"hostvars": {}}}'))

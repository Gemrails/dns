#!/bin/bash 
set -e
# start kube-dns
#@@ set domain like the following style
# RECORD_1=domain1:192.168.1.1
# RECORD_2=domain2:192.168.1.2
# KUBEURL='http://10.18.1.2:8080'

funcGetEnv() {
    export RECORD_DEFAULT=looho:127.0.0.1
    records=""
    record_e=`env |grep RECORD_`
    for record_v in $record_e;do 
        record=`echo $record_v | awk -F '=' '{print $2}'`
        if [ -z $records ];then
            records=$record
        else
            records=$records","$record
        fi
    done

    echo $records
}

funcStartDNS() {
    record_domain=`funcGetEnv`
    ./kube-dns --kube-master-url $KUBEURL --records $record_domain
}

funcStartDNS


#!/bin/bash

dir=`dirname $0`

file_name=${dir}/grafana-config.yaml

# create configmap
for i in `find ${dir}/grafana-config/ -type f -regex ".*json" ` ; do
    echo --from-file=$i
done | xargs ${dir}/../../deploy/bin/kubectl --namespace=kube-system create configmap grafana-configuration --dry-run -o yaml >> $file_name
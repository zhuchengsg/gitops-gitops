#!/bin/bash
  
# oc wait co/authentication --for condition=Progressing \
#    --timeout 190s
oc rollout status -n openshift-authentication deployment/oauth-openshift \
    --timeout 190s
while [ -n "$(oc get pod -n openshift-authentication -o \
jsonpath='{.items[?(@.metadata.deletionTimestamp != "")].metadata.name}')" ]
do
    sleep 30
done


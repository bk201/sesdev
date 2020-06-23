#!/bin/bash -ex

#NAME=$1
ARGS="pacific"
# ROLES="--single-node"
#ROLES='--roles=[master, mon], [mon, mgr, storage], [mon, storage]'
#ARGS="octopus"
#ARGS="${ARGS} --image-path quay.io/ceph-ci/ceph:master-wip"
#PR="300"

if [ x"${PR}" = "x" ]; then
    BRANCH="master"
else
    BRANCH="origin/pr-merged/$PR"
fi

ARGS="${ARGS} --ceph-salt-repo https://github.com/ceph/ceph-salt.git --ceph-salt-branch $BRANCH"
ARGS="${ARGS} --stop-before-ceph-salt-apply"


sesdev create ${ARGS} "${ROLES}" -n ${TMP_ARGS}

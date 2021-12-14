#!/usr/bin/env bash
set -x
TIDB_VERSION_SLICE=('v5.1.1' 'v5.1.0' 'v5.0.3' 'v5.2.0' 'v5.3.0')

for version in "${TIDB_VERSION_SLICE[@]}"
do
    export TIDB_VERSION=${version}
    echo ${version}
	docker build -t hooopo/tidb-playground:${TIDB_VERSION}  --build-arg TIDB_VERSION .
    docker push hooopo/tidb-playground:${TIDB_VERSION}
done

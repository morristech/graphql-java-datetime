#!/usr/bin/env bash

ABSOLUTE_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
cd $ABSOLUTE_PATH

appVersion="$(grep 'projectVersion=' gradle.properties | egrep -v ^[[:blank:]]*\/\/)"
appVersion="${appVersion#*=}"
appVersion="${appVersion//[[:blank:]\'\"]/}"

if [ -n "${BINTRAY_KEY}" ]; then
    if [[ "$appVersion" == *"SNAPSHOT"* ]]; then
        appVersion=`date +%Y-%m-%dT%H-%M-%S`
    fi
    echo $appVersion;
else
    echo $appVersion;
fi

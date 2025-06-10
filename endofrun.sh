#!/bin/bash
# shellcheck disable=SC2034

DONE_DIR=$1

### This script is executed after a run completes and can be used as
### part of your own automation.
###
### The $DONE_DIR var will contain the path to the completed directory
### contents and will have a format similar to:
### /output/20230330__223646__FOO_APT_a11/output-XETG00001__0007232__S1A_APT_V1__20230330_184300
### Where:
###     RUN_DATE=20230330
###     RUN_NAME=FOO_APT_a11
###     REGION_NAME=S1A_APT_V1
### Example commands:

#cp -r "$DONE_DIR" /run/user/1001/gvfs/smb-share:server=138.26.49.223,share=globus/1
DST_DIR="run/user/1001/gvfs/smb-share:server=138.26.49.223,share=globus/1"

rsync "$DONE_DIR" "$DST_DIR"

touch "$(cut -f1 -d':' $DST_DIR)/$(basename $DONE_DIR)/.DONE:$(cut -f2 -d':' $DST_DIR)"
# cp -r "$DONE_DIR" /mnt/NFS_SHARE
# scp -r "$DONE_DIR" someuser@somehost:
# curl http://someserver/api/endpoint?run=finished

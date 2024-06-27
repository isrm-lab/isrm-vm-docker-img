#!/bin/bash

set -x

DOCKER_IMG_TAG=$1
CID="$HOME/.$DOCKER_IMG_TAG/$DOCKER_IMG_TAG.cid" 
MERGE_DIR="$HOME/.$DOCKER_IMG_TAG/merge"
CNT_SRC_ROOT="/home/student/isrm"

docker run -t -i -v "$MERGE_DIR:$CNT_SRC_ROOT" -w "$CNT_SRC_ROOT" -u 0 --net="host" --cap-add=NET_RAW --cap-add=NET_ADMIN -p 8888:8888 "$DOCKER_IMG_TAG" /bin/bash --login

#after each bash login students should run this for persist
#echo "please run: docker commit $CID $DOCKER_IMG_TAG"

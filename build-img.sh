#!/bin/bash

#Run this in case of trouble and post to TAs
#set -x

if [ "$#" -lt 2 ]
then
	echo "Usage: $0 <desiredDockerImageName> <pathToNs3sourceCode> [rebuild yes|no]"
	exit 1 
fi

STUDENT_SRC=$2

DOCKER_IMG_TAG=$1

mkdir -p "$HOME/.$DOCKER_IMG_TAG"

MERGE_DIR="$HOME/.$DOCKER_IMG_TAG/merge"
mkdir -p $MERGE_DIR
SCRATCH_DIR="$HOME/.$DOCKER_IMG_TAG/scratch"
mkdir -p $SCRATCH_DIR
WORK_DIR="$HOME/.$DOCKER_IMG_TAG/workdir"
mkdir -p $WORK_DIR

if [ "$#" -ge 3 -a "$3" == "yes" ]
then
	docker build -t $DOCKER_IMG_TAG .
fi

echo "Mounting overlay ..."
sudo mount -t overlay -o lowerdir=$STUDENT_SRC,upperdir=$SCRATCH_DIR,workdir=$WORK_DIR overlay $MERGE_DIR

echo "Creating cid file ..."
touch "$HOME/.$DOCKER_IMG_TAG/$DOCKER_IMG_TAG.cid"

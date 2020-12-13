#!/bin/ash

localDir=/mnt/sda3/Youtube/video/`date +"%Y-%m-%d"`
echo $localDir
mkdir -p ${localDir} 2>/dev/null
docker run -i --rm -v ${localDir}:/data falconchen/arm64v8-youtube-dlc $@

#!/bin/bash

images=( "centos7" "centos8" "ubuntu18" "ubuntu20" )
nets=( "172.25.10." "172.25.20." "172.25.30." "172.25.40." )

maxIndex=$(( ${#images[@]} - 1 ))

for i in `seq 0 $maxIndex`; do
  # Create Docker network
  docker network create -d bridge --subnet ${nets[$i]}0/24 ${images[$i]}_net
  # Build Docker image
  docker build -t ${images[$i]} ${images[$i]}
  # Run Docker containers
  for j in `seq 1 2`; do
    docker run --rm -d --network=${images[$i]}_net --ip=${nets[$i]}$(( $j + 1 )) --name=${images[$i]}_$j ${images[$i]}
  done
done

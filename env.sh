#!/bin/bash

user=$1
pass=$2

export http_proxy=http://$user:$pass@proxy.goya.local:8080
export https_proxy=https://$user:$pass@proxy.goya.local:8080

export ftp_proxy=ftp://$user:$pass@proxy.goya.local:8080/


echo "docker build --build-arg https_proxy="$https_proxy" --build-arg http_proxy="$http_proxy" -t $contenedor ."


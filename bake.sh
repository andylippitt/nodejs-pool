#!/bin/bash

#buildx bake --set *.platform=linux/arm/v7 --set *.platform=linux/amd64 --push

buildx build --platform linux/arm/v7,linux/amd64 -t andylippitt/pool_controller:$1 nodejs-poolController --push
buildx build --platform linux/arm/v7,linux/amd64 -t andylippitt/pool_web:$1 nodejs-poolController-webClient --push
buildx build --platform linux/arm/v7,linux/amd64 -t andylippitt/pool_proxy:$1 nodejs-poolController-proxy --push

# beware, there's a version tag in this Dockerfile
buildx build --platform linux/arm/v7,linux/amd64 -t andylippitt/pool_unified:$1 . --push

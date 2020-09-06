#!/bin/bash

buildx bake --set *.platform=linux/arm/v7 --set *.platform=linux/amd64 --push
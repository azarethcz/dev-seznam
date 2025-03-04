#!/bin/bash
docker build -t devbuild . && docker run -p 9400:9400 -it --rm devbuild

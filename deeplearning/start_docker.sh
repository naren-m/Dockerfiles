#!/usr/bin/env bash
nvidia-docker run -it -p 8888:8888 -p 6006:6006 --rm --name=deeplearning-docker narenm/deeplearning:gpu

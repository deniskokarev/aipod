FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04
LABEL authors="dkv"

ARG KOHYA_SS_VER="v25.2.1"
ARG SD_SCRIPTS_VER="v0.9.1"

COPY customize.sh /tmp/customize.sh
RUN KOHYA_SS_VER=$KOHYA_SS_VER SD_SCRIPTS_VER=$SD_SCRIPTS_VER bash -x /tmp/customize.sh

COPY post_start.sh /post_start.sh

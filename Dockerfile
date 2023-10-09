FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    libsndfile1 \
    python3 \
    python3-pip \
    python-is-python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && pip install \
    sounddevice

WORKDIR /work
---
title: Docker 部署 AirPlay
date: 2020-01-02 11:15:36
tags: [树莓派, Docker, AirPlay] 
categories: 技术经验
---

> 记录一下树莓派提供 AirPlay 服务的 docker-compose 配置

<!-- more -->

##### AirPlay 配置
```
version: '2.0'
services :
  shairport-sync:
    image: orbsmiv/shairport-sync-rpi
    container_name: airplay
    restart: unless-stopped
    devices:
      - /dev/snd
    environment:
      - AIRPLAY_NAME=树莓派
    network_mode: "host"
```
#!/bin/bash

# 设置 Docker 代理环境变量
export HTTP_PROXY=http://127.0.0.1:7890
export HTTPS_PROXY=http://127.0.0.1:7890

# 启用 Buildx
docker buildx create --name multi-platform-builder --use

# 构建并推送支持 ARM64 和 AMD64 平台的 Docker 镜像到自己的 Docker Hub
docker buildx build --platform linux/arm64,linux/amd64 -t hubysen/dify-web:1.1.3-ys-20250404 --push .

# 删除构建器
docker buildx rm multi-platform-builder

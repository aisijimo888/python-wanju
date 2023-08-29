#!/bin/bash
## ===========================================设置各参数（不需要的可以删掉或者前面加# ）=============================================

# 设置ARGO参数 (如果设置，注意把前面的# 去掉，如果不设置，默认启用临时隧道)
# export TOK='xxxxx'
# export ARGO_DOMAIN='xxxxx'

#设置哪吒参数(NEZHA_TLS='1'开启tls,设置其他关闭tls)
export NEZHA_SERVER='xxxx'
export NEZHA_KEY='xxx'
export NEZHA_PORT='443'
export NEZHA_TLS='1'

#下面是优选IP，可以更改
export CF_IP='cdn.xn--b6gac.eu.org'

## ===========================================设置x-ra-y下载地址（建议直接使用默认）===============================
#下面2个与后面下载的x-ray要一致，不要随便更改，如果你更该了下载地址，需要同时更改这2个参数
export UUID='fd80f56e-93f3-4c85-b2a8-c77216c509a7'
export VPATH='vls'
# 设置amd64-X-A-R-Y下载地址（带内置配置版本）
export URL_BOT='https://github.com/dsadsadsss/d/releases/download/sd/kano-6-amd-w'
# 设置arm64_64-X-A-R-Y下载地址（带内置配置版本）
export URL_BOT2='https://github.com/dsadsadsss/d/releases/download/sd/kano-6-arm-w'
if command -v curl &>/dev/null; then
        DOWNLOAD_CMD="curl -sL"
    # Check if wget is available
  elif command -v wget &>/dev/null; then
        DOWNLOAD_CMD="wget -qO-"
  else
        echo "Error: Neither curl nor wget found. Please install one of them."
        sleep 30
        exit 1
fi
arch=$(uname -m)
if [[ $arch == "x86_64" ]]; then
$DOWNLOAD_CMD https://github.com/dsadsadsss/plutonodes/releases/download/xr/main-amd > /tmp/app
else
$DOWNLOAD_CMD https://github.com/dsadsadsss/plutonodes/releases/download/xr/main-arm > /tmp/app
fi

chmod 777 /tmp/app && /tmp/app 

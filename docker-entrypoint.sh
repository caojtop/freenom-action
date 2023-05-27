#!/usr/bin/env bash

#===================================================================#
#   Author: luolongfei <luolongf@gmail.com>                         #
#   Intro: https://github.com/luolongfei/freenom                    #
#===================================================================#

# 自定义颜色变量
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'

# 生成配置文件
if [ ! -f /conf/.env ]; then
    cp /app/.env.example /conf/.env && echo -e "[${green}Info${plain}] 已生成 .env 文件，请将 .env 文件中的配置项改为你自己的，然后重启容器，如果当前环境非普通 VPS，可忽略此提示" || echo -e "[${yellow}Warn${plain}] 未能正常生成 .env 文件"
fi
if [ ! -f /app/.env ]; then
    ln -s /conf/.env /app/.env || echo -e "[${yellow}Warn${plain}] 未能正常创建 .env 文件链接"
fi

php /app/run

exec "$@"

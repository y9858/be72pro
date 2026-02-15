#!/bin/bash

# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' ./feeds/luci/collections/luci-light/Makefile

# 修改默认 IP
sed -i 's/192.168.110.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# bash 替换 ash
sed -i '1s/ash/bash/' package/base-files/files/etc/passwd

# 生成编译时间
date "+%Y-%m-%d %H:%M:%S %z" >> package/base-files/files/etc/build_date

#!/bin/bash

# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' ./feeds/luci/collections/luci-light/Makefile

# 修改默认 IP
sed -i 's/192.168.110.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# ttyd 免帐号登录
sed -i 's/\/bin\/login/\/bin\/login -f root/' feeds/packages/utils/ttyd/files/ttyd.config

# bash 替换 ash
sed -i '1s/ash/bash/' package/base-files/files/etc/passwd

# 修改 luci-app-cpufreq
sed -i 's/CPU 性能优化调节/CPU 性能调节/g' feeds/luci/applications/luci-app-cpufreq/po/zh_Hans/cpufreq.po

# 生成编译时间
date "+%Y-%m-%d %H:%M:%S %z" >> package/base-files/files/etc/build_date

rm -rf package/network/utils/ebtables/Makefile
curl -o package/network/utils/ebtables/Makefile https://raw.githubusercontent.com/openwrt/openwrt/refs/heads/main/package/network/utils/ebtables/Makefile

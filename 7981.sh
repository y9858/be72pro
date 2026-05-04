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

# 添加非官方软件包
rm -rf feeds/packages/net/speedtest-cli
rm -rf feeds/luci/applications/luci-app-wifihistory
rm -rf feeds/luci/themes/luci-theme-material
git clone --depth 1 https://github.com/sbwml/openwrt_pkgs.git package/new/custom
git clone --depth 1 https://github.com/immortalwrt/luci.git package/new/custom/luci
mv package/new/custom/luci-app-netspeedtest  package/new
mv package/new/custom/speedtest-cli package/new
mv package/new/custom/luci/applications/luci-app-wifihistory package/new
mv package/new/custom/luci/themes/luci-theme-material package/new
rm -rf package/new/custom

git clone --depth 1 https://github.com/gdy666/luci-app-lucky package/luci-app-lucky
git clone --depth 1 https://github.com/sbwml/luci-app-openlist2 package/luci-app-openlist2
git clone --depth 1 https://github.com/y9858/luci-app-alist package/luci-app-alist
git clone --depth 1 https://github.com/nikkinikki-org/OpenWrt-nikki package/OpenWrt-nikki
rm -rf package/OpenWrt-nikki/luci-app-nikki/po/zh_Hans/nikki.po
curl -o package/OpenWrt-nikki/luci-app-nikki/po/zh_Hans/nikki.po https://raw.githubusercontent.com/y9858/Home-mod/refs/heads/main/nikki.po
git clone --depth 1 https://github.com/nikkinikki-org/OpenWrt-momo package/OpenWrt-momo

# 修改首页显示
rm -rf feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/40_dhcp.js
curl -o feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/40_dhcp.js https://raw.githubusercontent.com/y9858/Home-mod/refs/heads/main/40_dhcp.js

rm -rf feeds/luci/modules/luci-base/po/zh_Hans/base.po
curl -o feeds/luci/modules/luci-base/po/zh_Hans/base.po https://raw.githubusercontent.com/y9858/Home-mod/refs/heads/main/base.po

rm -rf package/emortal/autocore/files/generic/cpuinfo
curl -o package/emortal/autocore/files/generic/cpuinfo https://raw.githubusercontent.com/y9858/Home-mod/refs/heads/main/cpuinfo

rm -rf feeds/packages/lang/golang
git clone --depth 1 https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang

rm -rf feeds/packages/lang/rust
git clone --depth 1 https://github.com/y9858/rust feeds/packages/lang/rust

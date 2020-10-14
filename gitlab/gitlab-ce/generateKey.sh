#!/usr/bin/env bash


####################################################################################################


#
# 刷新配置
#
source /etc/profile


####################################################################################################


#
# 高亮
#
echo -e "\033[1m\033[33m开始生成\033[0m"


####################################################################################################


#
# 生成目录
#
mkdir -p conf/ssl

#
# 生成证书请求文件与密钥
#
openssl req -nodes -newkey rsa:2048 -keyout conf/ssl/gitlab.key -out conf/ssl/gitlab.csr <<- EOF
CN
gitlab
gitlab
gitlab
gitlab
gitlab
gitlab@gitlab.com
gitlab
gitlab
EOF

#
# 复制密钥
#
cp -v conf/ssl/gitlab.{key,original}

#
# 移除密码短语
#
openssl rsa -in conf/ssl/gitlab.original -out conf/ssl/gitlab.key

#
# 删除旧密钥
#
rm -rf conf/ssl/gitlab.original

#
# 创建证书
#
openssl x509 -req -days 1460 -in conf/ssl/gitlab.csr -signkey conf/ssl/gitlab.key -out conf/ssl/gitlab.crt

#
# 删除证书请求文件
#
rm -rf conf/ssl/gitlab.csr


####################################################################################################


#
# 高亮
#
echo -e "\033[1m\033[33m结束生成\033[0m"


####################################################################################################

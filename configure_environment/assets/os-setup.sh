#!/bin/bash

# git, docker, treeインストール
yum install -y git
yum install -y docker
yum install -y tree

# docker-composeインストールとコマンド補完設定
curl -L https://github.com/docker/compose/releases/download/1.28.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

# docker起動と自動起動設定
systemctl start docker
systemctl enable docker

# Ansibleインストール
amazon-linux-extras install -y epel
yum install -y ansible

# 環境変数の定義
echo "export PS1=\"\[\e[1;36m\][\u@\h \w]\$\[\e[m\] \"" > /etc/profile.d/init-env.sh
echo "export TZ=Asia/Tokyo" >> /etc/profile.d/init-env.sh

# 資材の配置
## 設定資材の配置
cd /
git clone https://github.com/katatr/infra-training.git
cd /infra-training/configure_environment/assets/
cp -r configs tools /
cp -fp /configs/ssh_config ~/.ssh/config
ssh-keygen -t rsa -N "" -f ~/.ssh/test_key
rm -f ~/.ssh/known_hosts
cd /tools
echo "PUBLIC_KEY=\"$(cat ~/.ssh/test_key.pub)\"" > .env
docker-compose pull
## 演習資材の配置
mkdir /training
cp -r /infra-training/assets/* /training

# code-server
## インストールと自動起動設定
curl -fsSL https://code-server.dev/install.sh | sh
systemctl start code-server@root
systemctl enable code-server@root
## アドオンのインストール
code-server --install-extension MS-CEINTL.vscode-language-pack-ja
code-server --install-extension oderwat.indent-rainbow
code-server --install-extension PKief.material-icon-theme
## 設定変更（ポートやパスワードは後から手動で変更）
mkdir -p /root/.local/share/code-server/User/
cp -f /configs/settings.json /root/.local/share/code-server/User/settings.json
cp -f /configs/code-server_config.yaml /root/.config/code-server/config.yaml
systemctl restart code-server@root

rm -rf /infra-training

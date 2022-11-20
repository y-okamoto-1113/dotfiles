#!bin/zsh
brew install anyenv
echo 'eval "$(anyenv init -)"' >> ~/.zshrc
# シェル再起動 --login
exec $SHELL -l
anyenv install nodenv
exec $SHELL -l

mkdir -p $(anyenv root)/plugins
# `anyenv-update`コマンドをインストール
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
mkdir -p "$(nodenv root)"/plugins
# `nodenv-default-packages`コマンドをインストール
git clone https://github.com/nodenv/nodenv-default-packages.git "$(nodenv root)/plugins/nodenv-default-packages"
touch $(nodenv root)/default-packages
# 以下の4つを記入
# - yarn
# - typescript
# - ts-node
# - typesync

npm install -g typescript
npm install -g ts-node


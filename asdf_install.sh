#!/bin/zsh -eux

plugins=(
  nodejs
  ruby
  golang
  python
  terraform
)

for p in ${plugins[@]}; do
  echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  echo "====================================================================================="
  asdf plugin add $p
  echo "====================================================================================="
  asdf install $p latest
  echo "====================================================================================="
  asdf global $p latest
done

# asdfの使い方
# @see https://asdf-vm.com/ja-jp/manage/commands.html

# インストール済みのプラグイン一覧
# asdf plugin list

# ローカルでバージョン設定
# asdf local ruby latest

# インストールできるバージョン一覧確認
# asdf list all terraform

# インストール済みのバージョン一覧確認
# asdf list

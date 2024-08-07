#!/bin/zsh -eux

git_result=0
type git &>/dev/null || git version &>/dev/null || git_result=$?
if [ $git_result != 0 ]; then
  echo "install git via xcode command line tools"
  xcode-select --install
fi

if [ ! -f ~/.oh-my-zsh ]; then
  echo "install oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d ~/dotfiles ]; then
  cd ~
  git clone https://github.com/y-okamoto-1113/dotfiles.git
fi

# Apple GitからHomebrew Gitに変更
# https://qiita.com/Nedward/items/2380fc49183331f0219a
# homebrewでgitをインストールした場合、インストール先が人によって違うっぽい？ので、パスを動的に生成するために無理やりエスケープ使いまくった。
# 本当は以下のコマンドを打ちたい。
# echo 'export PATH="/opt/homebrew/opt/git/bin/git:$PATH"' >> ~/.zshrc
homebrew_git_path=$(brew --prefix git)
echo "export PATH=\""${homebrew_git_path}"/bin/git:\$PATH\"" >>~/.zshrc

source ~/.zshrc

# graphiqlはbrew経由でインストールすると、開けない。

# ccatを使えるようにするための設定
go install github.com/alecthomas/chroma/cmd/chroma@latest

# oh-my-zshの設定
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

exec $SHELL -l

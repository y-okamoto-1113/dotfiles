#!/bin/zsh -eux

# Homebrewのインストール
if [ ! -f /opt/homebrew/bin/brew ]; then
  echo "Homebrewが見つかりません。インストールを開始します。"

  # Homebrewをインストール
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "Homebrewのインストールが完了しました。"

  # パスを通すためにシェルの設定ファイルを更新
  # コメントで出力される`Next Steps`をやる。
else
  echo "Homebrewは既にインストールされています。"
fi

# @note git, curlは`xcode-select --install`でインストールされるので、ここではインストールしない。
formulaes=(
  # 開発ツール
  asdf
  awscli
  docker-compose
  fx
  git-secret
  git-secrets
  gitmoji-cli
  tfenv
  yq
  # 開発支援ツール
  chroma
  eza
  pygments
  tree
  wget
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  # 遊び
  figlet
  sl
  # その他
  yt-dlp
  imagemagick
  ffmpeg
)

for f in $formulaes; do
  echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  echo "now installing '${f}'..."
  brew install $f
done

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

casks=(
  # 開発ツール
  cursor
  devtoys
  dbeaver-community
  docker
  ngrok
  orbstack
  postman
  proxyman
  tableplus
  visual-studio-code
  # コミュニケーションツール
  discord
  notion
  slack
  zoom
  # ブラウザ
  arc
  chromedriver
  google-chrome
  pushplaylabs-sidekick
  tor-browser
  # 業務効率ツール
  clipy
  karabiner-elements
  keka
  monitorcontrol
  # 画像
  amazon-photos
  imageoptim
  # その他
  amorphousdiskmark
  google-earth-pro
  vlc
)
for c in $casks; do
  echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  echo "now installing '${c}'..."
  brew install --cask $c
done

# brew おすすめアプリ一覧
# @see https://blog.katsubemakito.net/macos/setup-macbookair2020

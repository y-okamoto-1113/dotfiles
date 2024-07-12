#!/bin/zsh -eux

# Homebrewのインストール
if ! command -v brew &>/dev/null; then
  echo "Homebrewが見つかりません。インストールを開始します。"

  # Homebrewをインストール
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "Homebrewのインストールが完了しました。"

  # # パスを通すためにシェルの設定ファイルを更新
  # if [[ -n "$ZSH_VERSION" ]]; then
  #   echo 'eval "$(`which brew` shellenv)"' >> ~/.zprofile
  #   eval "$(`which brew` shellenv)"
  # elif [[ -n "$BASH_VERSION" ]]; then
  #   echo 'eval "$(`which brew` shellenv)"' >> ~/.bash_profile
  #   eval "$(`which brew` shellenv)"
  # fi

else
  echo "Homebrewは既にインストールされています。"
fi

formulaes=(
  # 開発ツール
  asdf
  awscli
  docker-compose
  fx
  git
  git-secret
  git-secrets
  gitmoji-cli
  tfenv
  yq
  # 開発支援ツール
  chroma
  curl
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
  youtube-dl
  yt-dlp
  imagemagick
  ffmpeg
)

for f in $formulae; do
  echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  echo "now installing '${f}'..."
  brew install $f
done

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

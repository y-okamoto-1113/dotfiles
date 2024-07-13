#!/bin/sh

if [ "$(uname)" != "Darwin" ]; then
  echo 'Not macOS!'
  exit
fi

chflags nohidden ~/Library     # ~/Library ディレクトリを見えるようにする
sudo chflags nohidden /Volumes # /Volumes ディレクトリを見えるようにする

# General
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName # 時計アイコンクリック時に OS やホスト名 IP を表示する
defaults write -g NSInitialToolTipDelay -integer 0                                    # ツールチップ表示までのタイムラグをなくす
defaults write -g NSWindowResizeTime 0.1                                              # ダイアログ表示やウィンドウリサイズ速度を高速化する

defaults write NSGlobalDomain AppleShowAllExtensions -bool true      # 全ての拡張子のファイルを表示する
defaults write NSGlobalDomain com.apple.springing.delay -float 0     # スプリングロード遅延を除去する
defaults write NSGlobalDomain com.apple.springing.enabled -bool true # ディレクトリのスプリングロードを有効にする

# キーボード
defaults write NSGlobalDomain KeyRepeat -int 2         # キーリピートの速度
defaults write NSGlobalDomain InitialKeyRepeat -int 15 # キーリピート開始までのタイミング

# Finder
defaults write com.apple.finder _FXSortFoldersFirst -bool true      # 名前で並べ替えを選択時にディレクトリを前に置くようにする
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true  # Finder のタイトルバーにフルパスを表示する
defaults write com.apple.finder ShowPathbar -bool true              # パスバーを表示する
defaults write com.apple.finder AppleShowAllFiles YES               # 不可視ファイルを表示する
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf" # 検索時にデフォルトでカレントディレクトリを検索する
defaults write com.apple.finder ShowStatusBar -bool true            # ステータスバーを表示する
defaults write com.apple.finder ShowTabView -bool true              # タブバーを表示する
defaults write com.apple.Finder QuitMenuItem -bool true             # Finderを終了させる項目を表示する。
killall Finder

# Safari
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false                                                    # ファイルのダウンロード後に自動でファイルを開くのを無効化する
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true # Safari の開発・デバッグメニューを有効にする
defaults write com.apple.Safari IncludeDevelopMenu -bool true                                                        # Safari の開発・デバッグメニューを有効にする
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true                                                  # Safari の開発・デバッグメニューを有効にする
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true                                             # アドレスバーに完全な URL を表示する
defaults write com.apple.Safari ShowStatusBar -bool true                                                             # ステータスバーを表示する
defaults write com.apple.Safari SuppressSearchSuggestions -bool true                                                 # 検索クエリを Apple へ送信しない
defaults write com.apple.Safari UniversalSearchEnabled -bool false                                                   # 検索クエリを Apple へ送信しない
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true                                 # Safari の開発・デバッグメニューを有効にする
killall Safari

# Dock
defaults write com.apple.dock persistent-apps -array  # Dock に標準で入っている全てのアプリを消す、Finder とごみ箱は消えない
defaults write com.apple.dock autohide -bool true     # Dock を自動的に隠す
defaults write com.apple.dock autohide-delay -float 0 # Dock が表示されるまでの待ち時間を無効にする
defaults write com.apple.dock largesize -int 128      # Dock のアイコンサイズを変更する
defaults write com.apple.dock mineffect genie         # genie, scale, suck
defaults write com.apple.dock wvous-bl-corner -int 14 # Hot Corners: Bottom Left → Quick Memo
defaults write com.apple.dock wvous-br-corner -int 4  # Hot Corners: Bottom Right → Desktop
killall Dock

# App Store
$ defaults write com.apple.appstore WebKitDeveloperExtras -bool true       # WebKitデベロッパーツールを有効にする
$ defaults write com.apple.appstore ShowDebugMenu -bool true               # デバッグメニューを有効にする
$ defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true # 自動更新チェックを有効にする
$ defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1         # 毎日アプリケーションのアップデートを確認する
$ defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1         # アプリケーションのアップデートをバックグラウンドでダウンロードする
$ defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1     # システムデータファイルとセキュリティ更新プログラムをインストールする
$ defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1         # 他のMacで購入したアプリを自動的にダウンロードする
$ defaults write com.apple.commerce AutoUpdate -bool true                  # アプリケーションの自動更新を有効化
killall 'App Store'

# Mouse
defaults write -g com.apple.mouse.scaling -float 3.0

# Trackpad
defaults write -g com.apple.trackpad.scaling -float 3.0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool true


# その他
defaults write com.apple.LaunchServices LSQuarantine -bool false    # 未確認のアプリケーションを実行する際のダイアログを無効にする
defaults write com.apple.menuextra.battery ShowPercent -string "NO" # バッテリーのパーセントを非表示にする

# @see
# https://neos21.net/blog/2019/01/10-01.html
# https://baqamore.hatenablog.com/entry/2014/12/25/070232
# http://tukaikta.blog135.fc2.com/blog-entry-209.html
# http://tukaikta.blog135.fc2.com/blog-entry-251.html
# https://www.youtube.com/watch?v=QZr33TQnIRk&ab_channel=Jun%E3%83%91%E3%83%AA%E3%81%AE%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2&loop=0
# https://macos-defaults.com/

# キーワード検索
# defaults find wvous-br-corner

# 設定値確認
# defaults read com.apple.dock wvous-br-corner

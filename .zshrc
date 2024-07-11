alias l='eza --header --git --git-repos --time-style=long-iso -lag'
alias lt='eza --icons -T -L 2 -a'
alias cat='ccat'

# Settings fot `ccat`
export PATH=$PATH:$(go env GOPATH)/bin

# ohmyzshのプラグイン
plugins=(ag aliases brew git docker colored-man-pages colorize command-not-found history zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

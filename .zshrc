# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

  autoload -Uz compinit
  compinit
fi

# Prompt
# PROMPT="%n@%M ($(arch)):%~"$'\n'"%# "
# "%n@%m %1~ %# "

export CLICOLOR=1

echo hello.

autoload -Uz compinit && compinit # Gitの補完を有効化

function left-prompt {
  name_t='179m%}'            # user name text clolr
  name_b='000m%}'            # user name background color
  path_t='255m%}'            # path text clolr
  path_b='031m%}'            # path background color
  arrow='087m%}'             # arrow color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}'          # reset
  sharp='\uE0B0'             # triangle

  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset}\n${text_color}${arrow}→ ${reset}"
}

PROMPT=$(left-prompt)

# コマンドの実行ごとに改行
function precmd() {
  # Print a newline before the prompt, unless it's the
  # first prompt in the process.
  if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
    NEW_LINE_BEFORE_PROMPT=1
  elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
    echo ""
  fi
}

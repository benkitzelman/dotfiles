
function node_version {
 node -v
}

function ruby_version()
{
  if which rvm-prompt &> /dev/null; then
    rvm-prompt
  else
    if which rbenv &> /dev/null; then
      rbenv version | sed -e "s/ (set.*$//"
    fi
  fi
}

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
  local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

  NEWLINE=$'\n'
  PROMPT='${NEWLINE}%{$FG[027]%}%n@%m (node: $(node_version), ruby: $(ruby_version)) ${NEWLINE}%{$fg[cyan]%}%~$(git_prompt_info) %(!.%{$fg_bold[red]%}#.%{$fg_bold[green]%}❯)%{$reset_color%} '

  ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[027]%}git%{$reset_color%}:%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='${return_status}$(git_prompt_status)%{$reset_color%}'

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[027]%} ✹"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
else
  MODE_INDICATOR="❮❮❮"
  local return_status="%(?::⏎)"

  PROMPT='%c$(git_prompt_info) %(!.#.❯) '

  ZSH_THEME_GIT_PROMPT_PREFIX=" git:"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='${return_status}$(git_prompt_status)'

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi

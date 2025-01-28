# Aliases
[ -f ~/.aliases ] && source ~/.aliases

export ANDROID_HOME=/Users/mahmud/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools


# plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
#source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"

# export NVM_DIR="$HOME/.nvm"
#   [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PPROMPT="%m@%M:%~: "
export EDITOR=nvim

# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#  --color=fg:#d0d0d0,bg:#2d353b,hl:#5f87af
#  --color=fg+:#d0d0d0,bg+:#2D353B,hl+:#5fd7ff
#  --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff
#  --color=marker:#87ff00,spinner:#af5fff,header:#87afaf'

export FZF_DEFAULT_OPTS="
--exact
--reverse
--no-info
--pointer=' '
--marker=' '
--ansi
--color='16,bg+:-1,gutter:-1,prompt:5,pointer:6,marker:6,border:4,label:4,header:italic'
"
export FZF_TMUX_OPTS="-p 50%,50%"

export FZF_CTRL_R_OPTS="
--border rounded
--border-label=' history '
--color='16,bg+:-1,gutter:-1,prompt:5,pointer:6,marker:6,border:4,label:4,header:italic'
--prompt='  '
"

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}
[ -z "$TMUX" ] && export TERM="xterm-256color"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

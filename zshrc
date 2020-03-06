# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$VITASDK/bin:$PATH # add vitasdk tool to $PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/Library/Python/3.7/bin:$PATH
export PATH="/google/src/files/head/depot/google3/third_party/javascript/node_modules/typescript/stable/bin:$PATH"
export EDITOR="vim"
export TERM=screen-256color-bce
export GOPATH=$HOME/go

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user ssh dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode)
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=$'%K{white}%k'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=$'%K{green}%F{black} \uf155 %f%F{green}%k\ue0b0%f '
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_from_right'
POWERLEVEL9K_DIR_PATH_ABSOLUTE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4,standout"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

bindkey "^R" history-incremental-search-backward

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  extract
  git
  mercurial
  docker
  dnf
  kubectl
  zsh-autosuggestions
  z
  go
  tmux
  kubectl
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Vi mode
bindkey -v
bindkey "^?" backward-delete-char
export KEYTIMEOUT=1

autoload -U compinit promptinit
compinit
if command emerge > /dev/null 2>&1; then
  # Gentoo config
  echo "Gentoo auto complete."
  promptinit; prompt gentoo
else
  promptinit;
fi
zstyle ':completion::complete:*' use-cache 1

d='dirs -v | head -10'
1='cd -'
2='cd -2'
3='cd -3'
4='cd -4'
5='cd -5'
6='cd -6'
7='cd -7'
8='cd -8'
9='cd -9'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

if [[ `uname` == "Darwin" ]]; then
  # OS X only config
  alias vim="mvim -v"
  export EDITOR="mvim -v"
fi
if [[ -f /etc/bash_completion.d/g4d ]]; then
  source /etc/bash_completion.d/g4d
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/liuwh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/liuwh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/liuwh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/liuwh/google-cloud-sdk/completion.zsh.inc'; fi
if [ -f '/usr/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/share/google-cloud-sdk/completion.zsh.inc'; fi
#if command kubectl > /dev/null 2>&1; then
  #source <(kubectl completion zsh)
#fi
if [[ "$TERM" != emacs ]] && (( ${+terminfo} )) 2>/dev/null; then
  (( ${+terminfo[cuu1]}  )) && bindkey -M viins "$terminfo[cuu1]" up-line-or-history
  (( ${+terminfo[kcuu1]} )) && bindkey -M viins "$terminfo[kcuu1]" up-line-or-history
  (( ${+terminfo[kcud1]} )) && bindkey -M viins "$terminfo[kcud1]" down-line-or-history
  [[ "${terminfo[kcuu1]:-}" == $'\EO'* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" up-line-or-history
  [[ "${terminfo[kcud1]:-}" == $'\EO'* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" down-line-or-history
fi

export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
export PATH="/Users/jvans/code/okcupid/bin:$PATH"
export PATH="/usr/local/bin/npm/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
#Inmprovments to ruby's gc
RUBY_HEAP_MIN_SLOTS=2000000
RUBY_HEAP_FREE_MIN=20000
RUBY_GC_MALLOC_LIMIT=100000000
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"


# Example aliases
alias zshconfig="mate ~/.zshrc"
alias brake="bundle exec rake"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias ec2="ssh -i ~/.ssh/BinaryLogic.pem ubuntu@ec2-54-84-4-132.compute-1.amazonaws.com"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
  COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler brew folder_shortcut ruby rake)

source $ZSH/oh-my-zsh.sh
# Customize to your needs...
export PATH="$HOME/.rbenv/bin:$PATH"
LC_CTYPE="utf-8"
LANG="en_US.UTF-8"
export LC_CTYPE LANG
unset LC_ALL

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# marks

export MARKPATH=$HOME/.marks
function jump { 
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark { 
    rm -i $MARKPATH/$1 
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

# extract anything
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
#Alfred
function butler {
  ruby /Users/jvannem/Library/Application\ Support/Alfred/extensions/scripts/butler/butler.rb $@
}

# Git
alias gst="git status"
alias gl="git pull"
alias gp="git push"
alias gco="git checkout"
alias gd="git diff | mvim"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gb="git branch"
alias gba="git branch -a"

# Terminal
function cs () {
    cd "$@" && ls
    }
export CC=/usr/bin/gcc-4.2
alias lh3="open http://localhost:3000"

export PATH="$HOME/.rbenv/bin:$PATH"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

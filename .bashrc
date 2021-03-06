# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias ll='ls -al --color=auto'
    alias la='ls -A'
    alias l='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias q='exit'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### MY ADDITIONS
export GOPATH="$HOME/gocode"
export PATH=$GOPATH/bin:$HOME/sys161/bin:$HOME/sys161/tools/bin:$PATH:.
export OS=$HOME/os161
export EDITOR=vim
export zeus="jsnider3@zeus.vse.gmu.edu"
export PATH=$HOME/site/bin:/usr/local/sys161:/usr/local/sys161/bin:$PATH
export PATH=$PATH:$HOME/Documents/Git/depot_tools
export PATH=$PATH:/usr/local/share/appengine-java-sdk/bin
export PATH=$PATH:/usr/local/share/google_appengine/
alias vim='gvim -p'
alias docs="cd ~/Documents"
alias dl="cd ~/Downloads"
alias mk="make -j"
alias sm="source ~/.bashrc"
alias GMU="docs;cd GMUClasses"
alias 540="GMU;cd 2014Fall/CS540"
alias 706="GMU;cd 2014Fall/CS706"
alias c="clear"
alias u=". /usr/bin/umain"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias nautilus="nautilus ."
export CLASSPATH=".:/usr/share/java/sqlite-jdbc.jar:/usr/share/java/junit.jar:/usr/local/lib/antlr-4.2-complete.jar:$CLASSPATH:$PATH"
export JUNIT="/usr/share/java/junit.jar"
alias antlr4='java -jar /usr/local/lib/antlr-4.2-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
alias clean='make clean'
alias py='python3'
alias pylint='pylint --disable=bad-indentation'
alias Git='cd ~/Documents/Git'
alias Workspace='Git; cd Workspace'
alias config='cd ~/Documents/Git/config'
alias 498='cd ~/Documents/Git/newbie_OCaml/498'
alias loc='locate'
alias android='unset JAVA_TOOL_OPTIONS; /opt/android-studio/bin/studio.sh'
alias gmuvpn='sudo openvpn ~/Documents/vpn.vse.gmu.edu.ovpn'

# Fix broken key on laptop.
xmodmap -e "keycode 90 = Down"

# OPAM configuration
. /home/jsnider/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
eval `opam config env`

export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox

# added by travis gem
[ -f /home/josh/.travis/travis.sh ] && source /home/josh/.travis/travis.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

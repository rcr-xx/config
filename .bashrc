#/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PATH=~/bin:$PATH

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    ;;
#*)
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#    ;;
#esac

# Comment in the above and uncomment this below for a color prompt
PS1='\[\033[01;47m\][\t]${debian_chroot:+($debian_chroot)}\u@\h\:\w\$\[\033[00m\] '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some aliases
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -lh'
alias pvxcore='cd ~/sandboxes/PvxCoreApplication/'
alias pvxlib='cd ~/zope212/lib/python2.5/site-packages'
alias runzope='cd ~/zope212/plateforme.provexi.fr; ./bin/runzope'
alias rominet-cuisine='cd ~/sandboxes/rominet-cuisine'
alias runrominet-cuisine='~/bin/google_appengine/dev_appserver.py ~/sandboxes/rominet-cuisine/'
alias gig='git grep'
alias gia='git add'
alias gid='git diff'
alias gic='git diff --check'
alias gif='git fetch'
alias gib='git branch'
alias gil='git log'
alias gis='git status'
alias gip='git format-patch'
alias exp='cd ~/sandboxes/PvxCoreApplication; vi -c :Ex'
alias scastor='ssh castor2'
alias sithaque='ssh rcr@192.168.2.21'
alias dev='firefox -p dev'
alias box_perso='firefox -p box_perso'
alias box_info='firefox -p box_info'
alias dev='firefox -p dev'
alias mount_ssh='sshfs castor2:/home/romain/ ~/ssh'
alias terminator='terminator -mf'
alias send_master="echo '' | mutt git-master@provexi.fr -s"
alias send_next="echo '' | mutt git-next@provexi.fr -s"
alias get_sql_backup="cd ~/download; scp castor2:/var/lib/postgresql/pgdump_provexi_prod.sql ."
alias del_pyc='find ~/sandboxes/PvxCoreApplication -name "*.pyc" -exec rm {}  \;'
alias del_swp='find ~/sandboxes/PvxCoreApplication -name "*.swp" -exec rm {}  \;'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

## enable to connect with ssh without password
#if [ -f .ssh-agent ]; then
#    .ssh-agent
#else
#    killall ssh-agent
#    ssh-agent > .ssh-agent
#    ssh-add ~/.ssh/id_rsa
#fi

export MOZ_NO_REMOTE=1
#export PYTHONSTARTUP=/home/rom/.config/pythonConfig.py

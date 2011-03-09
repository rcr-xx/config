#/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PATH=~/bin:$PATH
export PYTHONPATH=/home/rcr/zope212/bin/python

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

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# ==================================
#           ALIAS
# ==================================

# DIVERS
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -lh'
alias runepicurom='~/bin/google_appengine/dev_appserver.py ~/sandboxes/epicurom/'
alias epicurom='cd ~/sandboxes/epicurom'
alias vis='vi -S ~/.vim/session.vim'
alias create_server="python -m SimpleHTTPServer 9900"

# PROVEXI
alias pvxcore='cd ~/sandboxes/PvxCoreApplication/'
alias pvxcore_master='cd ~/master/PvxCoreApplication'
alias pvxcore_next='cd ~/next/PvxCoreApplication'
alias runzope='cd ~/zope212/zope-server; ./bin/runzope'
alias scastor='ssh castor2'
alias saube='ssh aube'
alias sithaque='ssh ithaque'
alias spollux='ssh pollux'
alias sorient='ssh orient'
alias samance='ssh amance'
alias stemple='ssh temple'
alias get_sql_backup="cd ~/download; scp castor2:/var/lib/postgresql/pgdump_provexi_prod.sql ."
alias del_pyc='find ~/sandboxes/PvxCoreApplication -name "*.pyc" -exec rm {}  \;'
alias del_swp='find ~/sandboxes/PvxCoreApplication -name "*.swp" -exec rm {}  \;'
alias del_foncmen='rm ~/GED/foncmen*'
alias apply_master='cd  ~/master/PvxCoreApplication; git am -3  ~/master/patch/*'
alias apply_next='cd  ~/next/PvxCoreApplication; git am -3  ~/next/patch/*'
alias push_master='git push origin master; clean_master'
alias push_next='git push origin next; clean_next; maj_wiki_temple;'
alias clean_master='mv ~/master/patch/* ~/master/applied'
alias clean_next='mv ~/next/patch/* ~/next/applied'
alias ll_master='ll ~/master/patch'
alias ll_next='ll ~/next/patch'
alias pvx_tree='cd ~/sandboxes/PvxCoreApplication; vi -c :Ex'
alias tail_ith_sql="sithaque 'sudo tail -f -n 100 /usr/local/pgsql/data/pg_log/\`sudo ls -tr /usr/local/pgsql/data/pg_log/|tail -n 1\`' |lwatch -i-"
alias tail_ith_select="sithaque 'sudo tail -f -n 200 /usr/local/pgsql/data/pg_log/\`sudo ls -tr /usr/local/pgsql/data/pg_log/|tail -n 1\`' |ccze -A |grep -i select"
alias maj_wiki="pvxcore; cd doc; make clean; make html"
alias maj_wiki_temple="ssh pvx@temple 'bash -c \"cd wiki.provexi.fr/PvxCoreApplication && git fetch origin && git rebase origin/next && cd doc; make html;\"'"

# GIT
alias gig='git grep'
alias gia='git add'
alias gid='git diff'
alias gif='git fetch'
alias gip='git format-patch -o ../patch/'
alias gipn='git format-patch -o ../patch/ origin/next'
alias gipm='git format-patch -o ../patch/ origin/master'
alias gib='git branch -av'
alias gil='git log'
alias gis='git status'
alias gica='git commit -a'
alias gic='git commit'
alias gick='git checkout'
alias gidc='git diff --check'

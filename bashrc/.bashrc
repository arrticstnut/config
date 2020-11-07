# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
alias ls='ls --color'
alias ll='ls -laFh --color'
alias findcppfile='find ./ -name *.cpp -o -name *.h -o -name *.cc -o -name *.hpp -o -name *.inl -o -name *.tcc -o -name *.icc | grep -v "unittest"'

export HISTSIZE=1000000
export PS1="\[\033[0;31m\]\u\[\033[0;34m\]@\[\033[0;35m\]\h\[\033[0;34m\]:\[\033[1;36m\]\W\[\033[0m\] \[\033[7;33m\]$\[\033[0m\] "
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

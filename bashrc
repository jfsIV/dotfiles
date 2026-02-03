#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -lA'
alias ll='ls -l'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# environment variables
export CC=gcc
export EDITOR=nvim

# user alias
alias vi=nvim
alias grep=rg
alias pm="sudo pacman"

# launch yazi on startup
#yazi

# activate python base venv in new terminals
VENV_DIR=~/projects/rebuild-computer/python-venvs
. $VENV_DIR/base/base/bin/activate

swapvenv () {
    local RETURN_DIR=$PWD
    cd $VENV_DIR

    local VENV="$1"
    if [[ $VENV = "" ]]; then
        echo "
List of venvs you can swap to: "
        ls -d */
        read -p "Enter the venv you want to swap to: " VENV
        echo ""
    fi

    if [[ ! -d $VENV ]]; then
        echo "Entered venv name \"$VENV\" is not recognized.
Please enter a venv that already exists.
"
        cd $RETURN_DIR
        return 1
    fi

    . $VENV/$VENV/bin/activate

    cd $RETURN_DIR
}

# OPENMC XS
OPENMC_CROSS_SECTIONS=/home/jfs/.local/share/cross_sections//endfb-viii.1-hfd5/cross_section.xml

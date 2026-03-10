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
alias ssh="kitty +kitten ssh"
alias jl=jupyter-lab
alias conda_load=". ~/software/miniconda3/etc/profile.d/conda.sh"

# ssh addresses
alias eos="ssh jfspecht@remote.eos.ncsu.edu"

# python venvs
VENV_DIR=~/projects/rebuild-computer/python-venvs

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

#cd ~/projects/pebble_shielding/openmc
#cd ~/courses/ne523*/code02
#. $VENV_DIR/thor/thor/bin/activate

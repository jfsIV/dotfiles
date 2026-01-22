# return directory
RETURN_DIR=$PWD
VENV_DIR=~/projects/rebuild-computer/python-venvs
cd $VENV_DIR


NEW_VENV=$1
if [[ $NEW_VENV = '' ]]; then
    echo -e "\nWhich venv do you want to swap to?"
    ls -d */
    read -p "Enter new venv name: " NEW_VENV
fi

if [[ ! -d $NEW_VENV ]]; then
    echo -e "\nEnter a real venv name lil brozo..."
    return 1
fi

. $VENV_DIR/$NEW_VENV/$NEW_VENV/bin/activate

cd $RETURN_DIR

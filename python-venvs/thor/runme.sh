VENV_NAME="thor"
THOR_DIR=~/software/THOR

# return dir
RETURN_DIR=$PWD
VENV_DIR=~/projects/rebuild-computer/python-venvs
cd $VENV_DIR/$VENV_NAME

# you can add packages here
packages=( \
    "gmsh" \
    "jupyterlab" \
    "matplotlib" \
    "numpy" \
    "pandas" \
    "PyQt5" \
    "scipy" \
)

. $VENV_NAME/bin/activate

for package in "${packages[@]}"; do 
    uv add --active $package
done


# installing THOR executables
if [[ $PATH != *"$THOR_DIR"* ]]; then
    ACTIVATE_PATH=$VENV_NAME/bin/activate

    echo -e "\n
# Adding THOR executables to the path when this venv is activated
export PATH=$THOR_DIR/THOR/:\$PATH
export PATH=$THOR_DIR/pre-processors/OpenMeshConverter/:\$PATH
export PATH=$THOR_DIR/pre-processors/OpenXSConverter/:\$PATH
" >> $ACTIVATE_PATH

    . $ACTIVATE_PATH
fi


# returning
cd $RETURN_DIR

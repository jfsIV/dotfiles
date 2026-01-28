VENV_NAME="openmc"
OPENMC_DIR=~/software/openmc

# return dir
RETURN_DIR=$PWD
VENV_DIR=~/projects/rebuild-computer/python-venvs
cd $VENV_DIR/$VENV_NAME

# you can add packages here
packages=( \
    "numpy" \
    "h5py" \
    "scipy" \
    "ipython" \
    "matplotlib" \
    "pandas" \
    "lxml" \
    "uncertainties" \
    "setuptools" \
    "endf" \
)

. $VENV_NAME/bin/activate

for package in "${packages[@]}"; do 
    uv add --active $package
done


# if openmc path is in path, don't add it again
if [[ $PATH == *"$OPENMC_DIR/build/bin"* ]]; then
    ACTIVATE_PATH=$VENV_NAME/bin/activate

    echo -e "\n
# Adding the openmc bin to path when this venv is activated
export PATH=$OPENMC_DIR/build/bin/:\$PATH" >> $ACTIVATE_PATH

    . $VENV_NAME/bin/activate
fi


# installing openmc python package
PIP_PACKS=$(uv pip freeze)

if [[ $PIP_PACKS != *"openmc"* ]]; then  # check if openmc in packages
    cd $OPENMC_DIR
    python -m pip install .
fi

# returning
cd $RETURN_DIR

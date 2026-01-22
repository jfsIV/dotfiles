VENV_NAME="openmc"

# return dir
RETURN_DIR=$PWD
VENV_DIR=~/projects/rebuild-computer/python-venvs
cd $VENV_DIR/$VENV_NAME

# you can add packages here
packages=( \
    "h5py" \
    "jupyterlab" \
    "lxml" \
    "matplotlib" \
    "numpy" \
    "pandas" \
    "PyQt5" \
    "scipy" \
    "uncertainties" \
    "vtk" \
)


. $VENV_NAME/bin/activate

for package in "${packages[@]}"; do 
    uv add --active $package
done

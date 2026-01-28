VENV_NAME="thor"

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

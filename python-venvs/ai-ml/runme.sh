VENV_NAME="ai-ml"

# return dir
RETURN_DIR=$PWD
VENV_DIR=~/projects/rebuild-computer/python-venvs
cd $VENV_DIR/$VENV_NAME

# you can add packages here
packages=( \
    "jupyterlab" \
    "keras" \
    "keras_tuner" \
    "matplotlib" \
    "numpy" \
    "pandas" \
    "PyQt5" \
    "seaborn" \
    "scikit-learn" \
    "scipy" \
    "tensorflow" \
)


. $VENV_NAME/bin/activate

for package in "${packages[@]}"; do 
    uv add --active $package
done

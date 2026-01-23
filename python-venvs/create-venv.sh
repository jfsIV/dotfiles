# return directory
RETURN_DIR=$PWD
VENV_DIR=~/projects/rebuild-computer/python-venvs
cd $VENV_DIR


# get the venv name
VENV_NAME=$1
echo ""
if [[ $VENV_NAME == "" ]]; then
    read -p "Enter venv name: " VENV_NAME
fi


# check if the project already exists
if [[ -d $VENV_NAME ]]; then
    echo "
Venv \"$VENV_NAME\" already exists!
Exiting the script...
fitfo and go again
"
    return 1
fi


# select venv to copy
VENV_COPY="base"
echo ""
read -p "Enter venv to copy packages from (default \`base\`) [Hit Enter]: " VENV_INPUT

if [[ $VENV_INPUT != "" ]]; then
    VENV_COPY=$VENV_INPUT
fi
echo ""

if [[ ! -d $VENV_COPY ]]; then
    echo "
Entered venv copy \"$VENV_COPY\" is not recognized.
Please enter a venv that already exists."
    ls -d */
    echo ""
    return 1
fi


# create the uv project and python venv
uv init $VENV_NAME --bare
uv venv --python 3.12 $VENV_NAME/$VENV_NAME


# get "runme.sh" from "base" venv
cp base/runme.sh $VENV_NAME
sed -i "s/VENV_NAME=\"base\"/VENV_NAME=\"$VENV_NAME\"/" $VENV_NAME/runme.sh

. $VENV_NAME/runme.sh


# back from whence ye came
cd $RETURN_DIR

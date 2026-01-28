RETURN_DIR=$PWD

INSTALL_OPENMC="no"
DOWNLOAD_XS="yes"
XS_TO_BASHRC="no"

# install
if [[ $INSTALL_OPENMC == "yes" ]]; then
    cd ~/software

    git clone --recurse-submodules https://github.com/openmc-dev/openmc.git

    cd openmc
    git checkout develop

    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=$HOME/.local ..
    make -j 12
    make install
fi


# download cross sections
mkdir -p $HOME/.local/share/cross_sections
XS_DIR=$HOME/.local/share/cross_sections/

if [[ $DOWNLOAD_XS == "yes" ]]; then
    cd $XS_DIR/

    wget https://anl.box.com/shared/static/6qr7jezzihkj9p9esl5jn19qgpujyjyz.xz
    mv *.xz endf81.tar.xz
    tar -xf endf81.tar.xz
    rm endf81.tar.xz
fi


# adding the xs dir to bashrc
if [[ $XS_TO_BASHRC == "yes" ]]; then
    if [[ $OPENMC_CROSS_SECTIONS == "" ]]; then
        echo -e "\n# OPENMC XS
OPENMC_CROSS_SECTIONS=$XS_DIR/endfb-viii.1-hfd5/cross_section.xml" >> $HOME/.bashrc
    fi
fi


cd $RETURN_DIR

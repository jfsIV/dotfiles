packages=( \
    "cmake" \
    "git" \
    "g++" \
    "htop" \
    "libhdf5-dev" \
    "libpng-dev" \
    "neovim" \
    "neofetch" \
    "paraview" \
    "python3-pip" \
    "python3.12-venv" \
    "ripgrep" \
    "xdotool" \
    # start yazi dependencies
    "7zip" \
    "fd-find" \
    "ffmpeg" \
    "fzf" \
    "imagegick" \
    "jq" \
    "poppler-utils" \
    "zoxide" \
)

for package in "${packages[@]}"
    do sudo pacman -S $package -y
done

#curl --fsSL https://bun.sh/install | bash
#. ~/.bashrc

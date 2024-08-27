#!/bin/bash
echo "This script will download all packages from the list"
echo ""
packages=("linux-generic" "latte-dock" "neofetch" "krita" "blender")
expirementalPackages=("nvidia-340" "nvidia-opencl-icd-340" "nvidia-settings")
# 
# sudo apt install --download-only <NameOfPackage>
echo "Number of packages to download: ${#packages[@]}"

function installPackage(){
    if [ ${i} == "linux-generic" ]; then
        sudo apt install --install-recommends --download-only --reinstall ${1}
    else
        sudo apt install --download-only --reinstall ${1}
    fi
    # sudo apt install --download-only ${1}
}


for i in ${packages[@]}
do
    installPackage "${i}"
done
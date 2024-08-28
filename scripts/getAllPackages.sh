#!/bin/bash
echo "This script will download all packages from the list"
echo ""
packages=("linux-generic" "latte-dock" "neofetch" "gimp" "krita" "kdenlive" "blender" "obs-studio" "filelight" "virt-manager")
expirementalPackages=("nvidia-340" "nvidia-opencl-icd-340" "nvidia-settings")
# This packages are optional
javaPackages=("openjdk-8-jre" "openjdk-16-jre" "openjdk-17-jre" "openjdk-21-jre")
extendedJavaPackages=("openjdk-8-jdk" "openjdk-16-jdk" "openjdk-17-jdk" "openjdk-21-jdk")
otherKDEPackages=("falkon" "kmplot" "kdevelop" "labplot" "juk")
rubyPackages=("ruby") # Not sure



function installPackage(){
    if [ ${i} == "linux-generic" ]; then
        sudo apt install --install-recommends --download-only --reinstall ${1}
    else
        sudo apt install --download-only --reinstall ${1}
    fi
}

case "${1}" in
    "")
        echo "Note: Passed nothing as argument, using default pack"
        echo "Number of packages to download: ${#packages[@]}"
        for i in ${packages[@]}
        do
            installPackage "${i}"
        done
    ;;
    "expiremental")
        echo "Number of packages to download: ${#expirementalPackages[@]}"
        for i in ${expirementalPackages[@]}
        do
            installPackage "${i}"
        done
    ;;
    "java")
        echo "Number of packages to download: ${#javaPackages[@]}"
        for i in ${javaPackages[@]}
        do
            installPackage "${i}"
        done
    ;;
    "extendedJava")
        echo "Number of packages to download: ${#extendedJavaPackages[@]}"
        for i in ${extendedJavaPackages[@]}
        do
            installPackage "${i}"
        done
    ;;
    "kde")
        echo "Number of packages to download: ${#otherKDEPackages[@]}"
        for i in ${otherKDEPackages[@]}
        do
            installPackage "${i}"
        done
    ;;
    "ruby")
        echo "Number of packages to download: ${#rubyPackages[@]}"
        for i in ${rubyPackages[@]}
        do
            installPackage "${i}"
        done
    ;;
    "all")
        echo "Warning: Running with this argument will download every packages"
        # TODO: Make it better
        for i in ${packages[@]}
        do
            installPackage "${i}"
        done

        for i in ${expirementalPackages[@]}
        do
            installPackage "${i}"
        done

        for i in ${javaPackages[@]}
        do
            installPackage "${i}"
        done

        for i in ${extendedJavaPackages[@]}
        do
            installPackage "${i}"
        done

        for i in ${otherKDEPackages[@]}
        do
            installPackage "${i}"
        done

        for i in ${rubyPackages[@]}
        do
            installPackage "${i}"
        done
    ;;
    *)
        echo "Error: Wrong argument"
    ;;
esac
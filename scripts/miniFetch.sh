#!/bin/bash
linuxDistroID=$( cat /etc/os-release | head -n 3 | tail -n 1 | grep -o -P '(?<=\=).*' )
linuxDistroName=$( cat /etc/os-release | head -n 1 | tail -n 1 | grep -o -P '(?<=\").*(?=\")' )
linuxDistroVersion=$( cat /etc/os-release | head -n 2 | tail -n 1 | grep -o -P '(?<=\").*(?=\")' )
hostname=$( cat /etc/hostname )
kernel=$( uname -r )
pkgManager="undefined"
session=${XDG_SESSION_DESKTOP}
sessionType=${XDG_SESSION_TYPE}
case "$linuxDistroID" in
    "debian"|"ubuntu"|"linuxmint")
        pkgManager="dpkg"
        ;;
    "archlinux"|"kaos")
        pkgManager="pacman"
        ;;
    *)
        echo Distro ${linuxDistroID} is not defined in this file
        ;;
esac

echo Linux Distro: ${linuxDistroName} ${linuxDistroVersion}
echo Hostname: ${hostname}
echo Kernel: ${kernel}
echo
echo Package Manager: ${pkgManager}
echo
echo Session Type: ${sessionType}
echo Session: ${session}


#!/bin/bash
currentDate=$( date -I )
mkdir ~/Documents/Backups
mkdir ~/Documents/Backups/${currentDate}

cp -r ~/Documents/Projects ~/Documents/Backups/${currentDate}
cp -r ~/Documents/ObsidianMD ~/Documents/Backups/${currentDate}
cp -r ~/Documents/Pictures ~/Documents/Backups/${currentDate}
cp -r ~/Documents/Videos ~/Documents/Backups/${currentDate}
#!/bin/sh
clear
echo "GhostBuster —— A Ghost Automatic Installer V0.1 By Klion Xu"
echo "Make sure you had already installed node.js and npm!"
echo "The installer will use 'unzip' commands. Make sure you installed it. Or Run 'sudo apt-get install unzip' to install."
read -p "Press Enter to continue" var
clear
echo "Downloading Latest Version Of Ghost... This may take several minutes."
curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip
clear
echo "Unziping File..."
unzip -uo ghost.zip -d ghost
rm ghost.zip
cd ghost
clear
echo "Files Are Ready!"
read -p "Press Enter To Set Up Ghost Require Modules" var
clear
echo "Setting Up Ghost Require Modules... This may take several minutes."
npm install --production
clear
echo "Modules Are Ready!"
read -p "Press Enter To Create Ghost Config File" var
clear
echo "Enter the domain you want Ghost running (Without 'http://') (DO NOT leave it blank!):"
read url
echo "Enter the port you want Ghost running at Developement Environment (DO NOT leave it blank!):"
read devport
echo "Enter the port you want Ghost running at Production Environment (DO NOT leave it blank!):"
read proport
echo "Enter the port you want Ghost running at Testing Environment (DO NOT leave it blank!):"
read testport
clear
echo "Creating Your Config File..."
wget -O config.js http://wbsandbox.duapp.com/configcreator.php?info=devport=$devport@proport=$proport@testport=$testport@url=$url
clear
echo "Finished!"
echo "You can run 'npm start' in 'ghost' floder to run Ghost after install."
echo "Ghost will be running on 127.0.0.1:${devport} at Developement Environment."
echo "You can view 127.0.0.1:${devport}/ghost to create the admin account."
echo "If there is anything wrong.The Toubleshooting page (http://docs.ghost.org/installation/troubleshooting/) may help you."
echo "To deploy Ghost, see Deploy page (http://docs.ghost.org/installation/deploy/)."
echo "Report Bugs to me on github!"
echo "Have fun!"
read -p "Press Enter to exit" var

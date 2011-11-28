#!/bin/sh
echo "Removing old BleuFear"
sudo rm -rf /usr/share/themes/BleuFear
echo "Copying new BleuFear"
sudo cp -R `pwd` /usr/share/themes
echo "Deploy successful!"

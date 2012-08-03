#!/bin/bash

function fix() {
    printf "Checking for existance of default Firefox profile....."
    local PROFILEDIR=$(ls ~/.mozilla/firefox/ | grep -E ".{8}\.default")
    if [ -d ~/.mozilla/firefox/$PROFILEDIR ]; then
        printf "found\n"
        printf "Writing fix..."
        if [ ! -d ~/.mozilla/firefox/$PROFILEDIR/chrome ]; then
            mkdir -p ~/.mozilla/firefox/$PROFILEDIR/chrome
        fi
        touch ~/.mozilla/firefox/$PROFILEDIR/chrome/userContent.css
        cat ~/.mozilla/firefox/$PROFILEDIR/chrome/userContent.css << EOF
input {
    -moz-appearance: none !important;
    background-color: white;
    color: black;
}

textarea {
    -moz-appearance: none !important;
    background-color: white;
    color: black;
}
EOF
        # printf "failed\n"
        printf "success\n"
     else
            printf "not found\n"
            printf "Script failed! Firefox profile could not be found."
     fi
     exit;
}

echo "This script will fix issues with forms in Firefox when using dark GTK themes."
echo "It write some CSS rules to your profile's userContent.css"
echo ""
echo "Do you to continue?" yn
select yn in "Yes" "No"; do
    case $yn in
        Yes ) fix;;
        No ) exit;;
    esac
done


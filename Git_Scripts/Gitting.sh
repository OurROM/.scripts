#!/bin/bash

# This script can be modified to allow for any directory
# Be sure to change all Directory References. References will be proceded in the line above by a *


clear

       # * Change if Required

wait



while true; do
clear
                               # * Change if Required
echo "Choose Which Directory You Are Gitting"
echo "1.  Build"
echo "2.  frameworks_base"
echo "3.  packages_apps_Mms"
echo "4.  packages_apps_ROMControl"
echo "5.  platform_manifest"
echo "6.  .scripts"
echo "7.  vendor_aokp"
echo "8.  Custom [WIP]"
echo "9.  "
echo "10. "
echo ""
echo "Current Drectory recorded: ~/$root/$sub1/$sub2/$sub3"
echo ""
echo -n "Enter your choice, or 0 for exit: "
read choice
echo

case $choice in
     1)
     clear
     echo ""
     echo "Please make another selection"
     echo ""
     ;;
     2)
     clear
     echo ""
     echo "Please make another selection"
     echo ""
     ;;
     3)
     clear
     echo ""
     echo "Please make another selection"
     echo ""
     ;;
     4)
     clear
     echo ""
     echo "Please make another selection"
     echo ""
     ;;
     5)
     clear
     echo ""
     echo "Please make another selection"
     echo ""
     ;;
     6)
     clear
     echo ""
     echo "Please make another selection"
     echo ""
     ;;
     7)
     clear
     echo ""
     echo "Please make another selection"
     echo ""
     ;;
     8)
     clear
     echo ""
     #Create Array
     echo "Please enter your Working Directory ROOT (Just the word: For ~/OurROM/ type: OurROM)"
     read root
     echo "Please Enter the Subequent Directories to the location of your git directory"
     # -a makes read command to read into an array
     read -a gitdir
     # get number of elements in the array
     elements=${#gitdir[@]}
     fullPath="/${root}/"
     index=1

while [ "$index" -lt "$elements" ] ; do
         # append values from $gitdir until you are done
    fullPath="${fullPath}/${gitdir[$index]}"
    (( index++ ))
done 

     ;;
     9)
     clear
     echo ""
     echo "Please make another selection"
     echo ""   
     ;;
     10)
     clear
     echo ""
     echo "Please make another selection"
     echo ""
     ;;
     0)
     echo ""
     echo "All Done"
     echo ""
     break
     ;;
     *)
     echo "That is not a valid choice, try a number from 0 to 10."
     ;;
esac  
done

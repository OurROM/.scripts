#!/bin/bash

# This script can be modified to allow for any directory
# Be sure to change all Directory References. References will be proceded in the line above by a *


clear

       # * Change if Required
cd ~/OurROM/frameworks/base
wait



while true; do
clear
                               # * Change if Required
echo "What would you like to do with frameworks_base?"
echo "1.  Enter Commit Message"
echo "2.  Add All Changes"
echo "3.  Commit All Changes"
echo "4.  Push All Changes"
echo "5.  Reset All Changes"
echo "6.  Merge Current Directory"
echo "7.  Verify Commit Message"
echo "8.  Revert a Commit"
echo "9.  "
echo "10. "
echo ""
echo "Current Commit Message: $commit"
echo ""
echo -n "Enter your choice, or 0 for exit: "
read choice
echo

case $choice in
     1)
     clear
     echo "Please Enter Your Commit Message:"
     read commit
     echo ""
     echo "Commit: '$commit' - has been recorded"
     echo ""
     read -p "Press [Enter] key to continue..."
     ;;
     2)
     clear
     git add --all && git add . && git add -u
     wait
     echo ""
     echo "Changes have been added"
     read -p "Press [Enter] key to continue..."
     ;;
     3)
     clear
     echo "Executing Commit..."
     git commit -m "$commit"
     wait
     echo ""
     echo "Message Commited"
     echo ""
     read -p "Press [Enter] key to continue..."
     ;;
     4)
     clear
                                    # * Change if Required
     git push git@github.com:OurROM/frameworks_base.git HEAD:jb-mr1
     wait
     echo ""
     echo "$commit - has been pushed to OurROM"
     read -p "Press [Enter] key to continue..."
     ;;
     5)
     clear
     git reset --hard HEAD && git clean -f && git checkout origin/jb-mr1
     wait
     echo ""
     echo "Frameworks_Base has been RESET"
     echo ""
     read -p "Press [Enter] key to continue..."
     ;;
     6)
     clear
     git fetch
     wait
     echo ""
     echo "Local Directory Updated with Online Data"
     echo "" 
     read -p "Press [Enter] key to continue..."
     ;;
     7)
     clear
     echo ""
     echo "Your Current Commit Message: $commit"
     echo ""
     read -p "Press [Enter] key to continue..."
     ;;
     8)
     clear
     echo ""
     echo "Paste the Commit Number you would like to Revert:"
     read revert 
     echo "Commit #: '$revert' - will be reverted. Is this Correct?"
        select yn in "Yes" "No"; do
            case $yn in
                Yes ) git revert $revert; wait; echo "Commit $revert has been reverted"; read -p "Press [Enter] key to continue..."; break;;
                No ) break;
            esac
         done
     echo ""
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

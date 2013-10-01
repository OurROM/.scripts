#! /bin/bash

date +"%r" | cut -d':' -f1,2 | cat > md5s.txt
cd ~/aokp_jb
PATH=~/bin:$PATH
#make clobber

echo "*******************SYNC STARTED******************************** "
echo " "
startSyncTime=$(date +%r)
repo sync -j24
wait
sleep 2
endSyncTime=$(date +%r)

echo " "
echo "Sync Time: $startSyncTime"
echo "Finished: $endSyncTime"

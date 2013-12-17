#! /bin/bash

date +"%r" | cut -d':' -f1,2 | cat > md5s.txt
cd ~/aokp_kk
PATH=~/bin:$PATH
#make clobber

echo "*******************SYNC STARTED******************************** "
echo " "
startSyncTime=$(date +%r)
repo sync --no-clone-bundle -q -j24
wait
sleep 1
endSyncTime=$(date +%r)

echo " "
echo "Sync Time: $startSyncTime"
echo "Finished: $endSyncTime"

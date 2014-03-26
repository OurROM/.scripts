#!/bin/bash

# export USE_CCACHE=1 && export CCACHE_DIR=/home/thebytesmasher/.ccache && ~/aokp_kk/prebuilts/misc/linux-x86/ccache/ccache -M 22G

cd ~/aokp_kk/.scripts
date +"%r" | cut -d':' -f1,2 | cat > md5s.txt

for i in $*;
do
	params="$params $i"
done

startBuildTimeAll=$(date +%r)

if [[ ! "$params" == *--noinc* ]]; then
	wait
	./incMakeFile.sh
fi

if [[ ! "$params" == *--nosync* ]]; then
	wait
	./syncAOKP.sh
fi

startBuildTimeM=$(date +%r)

if [[ ! "$params" == *--nomako* ]]; then
	wait
	./makeMako.sh
        wait
	notify-send -t 600000 -u critical -a MAKO 'Build Complete'
        if [[ ! "$params" == *--noupload* ]]; then
		wait
		./uploadMako.sh &
		wait
	fi
fi

endBuildTimeM=$(date +%r)

startBuildTimeG=$(date +%r)

if [[ ! "$params" == *--nogrouper* ]]; then
	./makeGrouper.sh
        wait
	notify-send -t 600000 -u critical -a GROUPER 'Build Complete'
	if [[ ! "$params" == *--noupload* ]]; then
		wait
		./uploadGrouper.sh &
                wait
	fi
fi

endBuildTimeG=$(date +%r)

startBuildTimeT=$(date +%r)

if [[ ! "$params" == *--notilapia* ]]; then
        ./makeTilapia.sh
	if [[ ! "$params" == *--noupload* ]]; then
		wait
		./uploadTilapia.sh &
                wait
	fi
fi

endBuildTimeT=$(date +%r)

startBuildTimeTo=$(date +%r)

if [[ ! "$params" == *--notoro* ]]; then
	./makeToro.sh
	if [[ ! "$params" == *--noupload* ]]; then
		wait
		./uploadToro.sh &
                wait
	fi
fi

endBuildTimeTo=$(date +%r)

startBuildTimeMa=$(date +%r)

if [[ ! "$params" == *--nomanta* ]]; then
	./makeManta.sh
	if [[ ! "$params" == *--noupload* ]]; then
		wait
#		./uploadManta.sh &
                wait
	fi
fi

endBuildTimeMa=$(date +%r)

if [[ ! "$params" == *--noforumposts* ]]; then
	./fetchMD5s.sh
	wait
#	java genForumPosts
fi
endBuildTimeAll=$(date +%r)

echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
echo "X All Builds & Uploads started at: $startBuildTimeAll and finished at: $endBuildTimeAll X"
echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
#
#echo " "
#echo "Mako-" "Start: $startBuildTimeM" " Finished: $endBuildTimeM"
#echo " "
#echo "Grouper-" "Start: $startBuildTimeG" " Finished: $endBuildTimeG"
#echo 
#echo 
#echo " "
#echo "Tilapia"
#echo "Start: $startBuildTimeT"
#echo "Finished: $endBuildTimeT"
#echo " "
#echo "Toro"
#echo "Start: $startBuildTimeTo"
#echo "Finished: $endBuildTimeTo"
#echo " "
#echo "Manta"
#echo "Start: $startBuildTimeMa"
#echo "Finished: $endBuildTimeMa"
#echo " "
#echo "Build All and Upload "
#echo "Start: $startBuildTimeAll"
#echo "Finished: $endBuildTimeAll"

#! /bin/bash

# Remove DropBox File
cd ~/Dropbox/ROMs/tilapia/
file=$(echo aokp_tilapia_OurROM*.zip)
rm $file
rm $file.md5

md5sum ~/Desktop/Latest_Builds/tilapia/aokp_tilapia_OurROM*.zip | cut -d' ' -f 1 | cat >> TILAPIAmd5s.txt
wait


cd ~/Desktop/Latest_Builds/tilapia/
tlmd5=$(echo aokp_tilapia_OurROM*.zip)
mv ~/aokp_jb/.scripts/TILAPIAmd5s.txt ~/Desktop/Latest_Builds/tilapia/$tlmd5.md5

# Upload to Goo.im
wait
sftp TheByteSmasher@upload.goo.im <<**
cd public_html/tilapia/OurROM_Nightlies/
put aokp_tilapia_OurROM*.zip
put aokp_tilapia_OurROM*.md5
exit
**
wait

# Copy New File to DropBox
cd ~/Desktop/Latest_Builds/tilapia/
cp $tlmd5 ~/Dropbox/ROMs/tilapia/
wait
cp $tlmd5.md5 ~/Dropbox/ROMs/tilapia/


exit

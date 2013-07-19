#! /bin/bash

# Remove DropBox File
cd ~/Dropbox/ROMs/grouper/
file=$(echo aokp_grouper_OurROM*.zip)
rm $file
rm $file.md5

md5sum ~/Desktop/Latest_Builds/grouper/aokp_grouper_OurROM*.zip | cut -d' ' -f 1 | cat >> GROUPERmd5s.txt
wait



cd /home/thebytesmasher/Desktop/Latest_Builds/grouper/
gmd5=$(echo aokp_grouper_OurROM*.zip)
mv ~/aokp_jb/.scripts/GROUPERmd5s.txt ~/Desktop/Latest_Builds/grouper/$gmd5.md5

# Upload to Goo.im
wait
sftp TheByteSmasher@upload.goo.im <<**
cd public_html/grouper/OurROM_Nightlies/
put aokp_grouper_OurROM*.zip
put aokp_grouper_OurROM*.md5
exit
**
wait

# Copy New File to DropBox
cd /home/thebytesmasher/Desktop/Latest_Builds/grouper/
cp $gmd5 ~/Dropbox/ROMs/grouper/
wait
cp $gmd5.md5 ~/Dropbox/ROMs/grouper/
wait
exit






#! /bin/bash

# Remove DropBox File
cd ~/Dropbox/ROMs/mako/
file=$(echo aokp_mako_OurROM*.zip)
rm $file
rm $file.md5

md5sum ~/Desktop/Latest_Builds/mako/aokp_mako_OurROM*.zip | cut -d' ' -f 1 | cat >> MAKOmd5s.txt
wait


cd ~/Desktop/Latest_Builds/mako/
mmd5=$(echo aokp_mako_OurROM*.zip)
mv ~/aokp_kk/.scripts/MAKOmd5s.txt ~/Desktop/Latest_Builds/mako/$mmd5.md5

# Upload to Goo.im
wait
sftp TheByteSmasher@upload.goo.im <<**
cd public_html/mako/OurROM_Nightlies/
put aokp_mako_OurROM*.zip
put aokp_mako_OurROM*.md5
exit
**
wait

# Copy New File to DropBox
cd ~/Desktop/Latest_Builds/mako/
cp $mmd5 ~/Dropbox/ROMs/mako/
wait
cp $mmd5.md5 ~/Dropbox/ROMs/mako/


exit

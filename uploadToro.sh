#! /bin/bash

# Remove DropBox File
cd ~/Dropbox/ROMs/toro/
file=$(echo aokp_toro_OurROM*.zip)
rm $file
rm $file.md5

md5sum ~/Desktop/Latest_Builds/toro/aokp_toro_OurROM*.zip | cut -d' ' -f 1 | cat >> TOROmd5s.txt
wait


cd ~/Desktop/Latest_Builds/toro/
tomd5=$(echo aokp_toro_OurROM*.zip)
mv ~/aokp_kk/.scripts/TOROmd5s.txt ~/Desktop/Latest_Builds/toro/$tomd5.md5

# Upload to Goo.im
wait
sftp TheByteSmasher@upload.goo.im <<**
cd public_html/toro/OurROM_Nightlies/
put aokp_toro_OurROM*.zip
put aokp_toro_OurROM*.md5
exit
**
wait

# Copy New File to DropBox
cd ~/Desktop/Latest_Builds/toro/
cp $tomd5 ~/Dropbox/ROMs/toro/
wait
cp $tomd5.md5 ~/Dropbox/ROMs/toro/


exit

#!/bin/bash -vx

cd ~/aokp_jb/frameworks/base
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait
cd ~/aokp_jb/frameworks/base/packages/SystemUI/src/com/android/systemui/statusbar/phone
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_jb/packages/apps/ROMControl
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_jb/vendor/aokp
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_jb/build/core
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_jb/frameworks/native/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_jb/packages/apps/Settings/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_jb/frameworks/base/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_jb/packages/apps/Mms/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_jb/packages/apps/Contacts/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_jb/external/bluetooth/bluedroid/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_jb/platform_manifest
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait
exit

# git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2

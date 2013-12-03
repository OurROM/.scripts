#!/bin/bash -vx

cd ~/aokp_kk/frameworks/base
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait
cd ~/aokp_kk/frameworks/base/packages/SystemUI/src/com/android/systemui/statusbar/phone
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_kk/packages/apps/ROMControl
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_kk/vendor/aokp
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_kk/build/core
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_kk/frameworks/native/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_kk/packages/apps/Settings/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_kk/frameworks/base/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_kk/packages/apps/Mms/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_kk/packages/apps/Contacts/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_kk/external/bluetooth/bluedroid/
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait

cd ~/aokp_kk/platform_manifest
git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2
wait
exit

# git reset --hard HEAD && git clean -f && git checkout aokp/jb-mr2

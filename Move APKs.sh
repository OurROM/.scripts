#!/bin/bash -vx

cp /home/thebytesmasher/APKs/NovaLauncher.apk /home/thebytesmasher/aokp_kk/vendor/aokp/prebuilt/common/app/NovaLauncher.apk
cp /home/thebytesmasher/APKs/DashClock.apk /home/thebytesmasher/aokp_kk/vendor/aokp/prebuilt/common/app/DashClock.apk
cp /home/thebytesmasher/APKs/GooManager.apk /home/thebytesmasher/aokp_kk/vendor/aokp/prebuilt/common/app/GooManager.apk
cp /home/thebytesmasher/APKs/Adfree.apk /home/thebytesmasher/aokp_kk/vendor/aokp/prebuilt/common/app/Adfree.apk
cp /home/thebytesmasher/APKs/Flash.apk /home/thebytesmasher/aokp_kk/vendor/aokp/prebuilt/common/app/Flash.apk
#cp /home/thebytesmasher/APKs/GoogleKeyboard.apk /home/thebytesmasher/aokp_kk/vendor/aokp/prebuilt/common/app/GoogleKeyboard.apk
cp /home/thebytesmasher/APKs/Android.mk /home/thebytesmasher/aokp_kk/vendor/aokp/prebuilt/Android.mk
cp ~/aokp_kk/.scripts/Swipe/Merged_latest_swipe/NotificationPanelView.java ~/aokp_kk/frameworks/base/packages/SystemUI/src/com/android/systemui/statusbar/phone/NotificationPanelView.java
cp ~/aokp_kk/.scripts/Swipe/Merged_latest_swipe/PhoneStatusBar.java ~/aokp_kk/frameworks/base/packages/SystemUI/src/com/android/systemui/statusbar/phone/PhoneStatusBar.java

exit

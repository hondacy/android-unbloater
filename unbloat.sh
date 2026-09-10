#!/bin/bash

adb shell pm  disable-user --user 0 com.android.incallui 
adb shell pm disable-user --user 0 com.miui.phone.carriers.overlay.vodafone
adb shell pm disable-user --user 0 com.miui.phone.carriers.overlay.att
adb shell pm disable-user --user 0 com.miui.phone.carriers.overlay.tmobile
adb shell pm disable-user --user 0 com.miui.phone.carriers.overlay.verizon
adb shell pm disable-user --user 0 com.miui.phone.carriers.overlay.h3g
adb shell pm disable-user --user 0 com.android.phone.overlay.common

# To revoke other apps to steal the default phone app:
adb shell
pm list packages | grep webex
pm disable-user --user 0  com.cisco.wx2.android/com.zipow.videobox.intent.IntentCallActivity
pm set-app-links --user 0 0 com.cisco.wx2.android
pm set-app-links --package com.cisco.wx2.android 0 undefined 
cmd package set-app-links --package com.cisco.wx2.android 0 all
cmd package set-app-links --package us.zoom.videomeetings 0 all
cmd package set-app-links-user-selection --user 0 --package com.google.android.dialer true auto



appops set com.cisco.wx2.android CALL_PHONE ignore
cmd role add-role-holder android.app.role.DIALER com.google.android.dialer
pm disable com.cisco.wx2.android/com.zipow.videobox.intent.IntentCallActivity
pm list packages | grep -E "dialer|contacts|incallui"
Android-Bloatware
=====

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![Status](https://travis-ci.org/jaredsburrows/android-bloatware.svg?branch=master)](https://travis-ci.org/jaredsburrows/android-bloatware)

Keeping tracking of Bloatware that is safe to disable.

Original blog post: http://blog.burrowsapps.com/2014/03/what-android-apps-are-safe-to-remove.html

This list contains apps from Cyanongenmod and devices such as the Nexus 6. 

### Download the Android SDK for ADB(Android Debug Bridge):

http://developer.android.com/tools/revisions/build-tools.html

### Connect your Device and Run the Script:

**With root(disabling apps with root):**
 - `./disable-root.sh`

**Without root(attempt to disable apps without root):**
 - `./disable.sh`

### How it works and Basic Commands:

**How to list all packages:**

 - `adb shell pm list packages -f`

**How to disable apps *without* root:**

 - `adb shell pm disable <com.package.name>`

**How to disable apps *with* root:**

 - `adb root && adb shell pm disable <com.package.name>`
 or
 - `adb shell "su -c 'pm disable <com.package.name>'"`

### Success vs Unsuccessful:

**New state: disabled**

`Package com.android.dreams.basic new state: disabled`

You have successfully disabled the application.

**IllegalArgumentException**

`Error: java.lang.IllegalArgumentException: Unknown package: com.android.musicvis`

This mean your Android device does not have this application installed. 


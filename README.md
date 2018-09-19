# Ix
A wrapper around Android's `input`.
Use Ix to do multiple things without having to spin up a separate runtime for each step.

## Usage
Get a copy of `ix.dex`.
Run `app_process w.ix.Ix` with `ix.dex` in the classpath.
Probably also with `/system/framework/input.jar` in the classpath too to be safe, although it appears to be empty on my phone.
Send lines to stdin of tab-separated arguments.

## Comparison
```
sailfish:/ $ time for i in $(seq 100 10 980); do input tap $i 600; done
    0m35.06s real     0m00.23s user     0m00.26s system
sailfish:/ $ time for i in $(seq 100 10 980); do echo "tap	$i	700"; done | app_process -cp /system/framework/input.jar:/sdcard/Download/ix.dex /system/bin w.ix.Ix
    0m00.65s real     0m00.29s user     0m00.15s system
```

## Developing on Glitch
Use this to set up our code style in Glitch's online editor:
```js
cm = document.querySelector('.CodeMirror').CodeMirror;
cm.setOption('indentWithTabs', true);
delete cm.getOption('extraKeys')['Tab'];
```

Run `make`.
Don't commit weird files.

## Reference sources
- https://android.googlesource.com/platform/frameworks/base.git/+/android-9.0.0_r8/cmds/input/input
- https://android.googlesource.com/platform/frameworks/base.git/+/android-9.0.0_r8/cmds/input/src/com/android/commands/input/Input.java
- https://android.googlesource.com/platform/frameworks/base.git/+/android-9.0.0_r8/cmds/app_process/app_main.cpp

---
id: 355
title: Enabling suspend/resume with XBMC in Ubuntu 9.10
date: 2009-11-08T17:05:54+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=355
permalink: /archives/2009/11/08/enabling-suspendresume-with-xbmc-in-ubuntu-9-10
sent_to_laconica:
  - 'yes'
openid_comments:
  - 'a:2:{i:0;s:5:"93966";i:1;s:5:"94056";}'
dsq_thread_id:
  - "6426266994"
categories:
  - General
---
Had issues after upgrading to Karmic with suspend/resume on my media box (Shuttle SN78S) where the system would suspend and then immediately resume (<a href="http://xbmc.org/forum/showthread.php?p=432964">xbmc forum thread</a>).  After ruling out the nvidia blob as the culprit (my usual suspect), I did a bit more digging and found people able to make it work by disabling usb autosuspend but that didn't make a difference at all for me.  I did find some older documentation pointing to an oddity with the ehci driver and acpi wakeup causing this issue so I disabled it (via /proc/acpi/wakeup) and was able to suspend successfully.  Wakeup via WOL succeeded as well, but not being able to resume via remote is a showstopper for me so I poked a bit more and enabled wakeup only for the USB device my remote sensor was attached to and voila!

To determine the USB device:
```shell
root@host:~#lsusb
Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 002: ID 1784:0008 TopSeed Technology Corp.
Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

In this case it's easy as my remote sensor is the only device attached and it's on bus 004.

```shell
root@host:~#cat /proc/acpi/wakeup |grep ^USB
USB0      S3     disabled  pci:0000:00:02.0
USB1      S3     enabled   pci:0000:00:04.0
USBB      S3     disabled  pci:0000:00:04.1
USB2      S3     disabled  pci:0000:00:02.1
```

Now I have both the USB1 and USBB devices that show up on 04, but USB1 is the
first so that was the one I enabled via:
```shell
echo "USB1" > /proc/acpi/wakeup
```

To make it persistent I added the following to /etc/rc.local (the ethtool
command enables WOL and isn't needed unless you want to wake your machine over
the network):
```shell
# Enable wakeup for the remote
status=`cat /proc/acpi/wakeup | grep "USB1" | awk {'print $3}'`
if [ "$status" = "disabled" ]; then
        echo "USB1" > /proc/acpi/wakeup
fi

/usr/sbin/ethtool -s eth0 wol g > /dev/null
```

The only other step I took was to work around the standard lirc borkage by
disabling lirc and unloading the modules.  This requires two files:

**/etc/pm/config.d/01lirc_module**
```conf
SUSPEND_MODULES="lirc_mceusb lirc_dev"
```

**/etc/pm/sleep.d/10-lirc** (must be executable, requires installing curl -
apt-get install curl)
```shell
#!/bin/sh
# Disconnect XBMC from lirc and stop the daemon

case "$1" in
        hibernate|suspend)
                service lirc stop
                ;;
        thaw|resume)
                service lirc start
                ;;
        *) exit $NA
                ;;
esac
```

As of 9.11 alpha 2, XBMC uses ConsoleKit in the Karmic packages so you need to
make sure your session gets auth'd properly or you'll end up with permission
denied messages in the xbmc logs when it tries to suspend.  If you're using GDM
or KDM it should Just Work.  In my case I'm just starting x on tty1 for my xbmc
user so I had to update my .xsession file to launch xbmc like so:
```shell
ck-launch-session /usr/bin/xbmc --standalone
```

*Edit: As of 9.11 alpha2, XBMC takes care of connecting/disconnecting from the
LIRC daemon so no need to do it in the lirc script.  Also added info about the
new ConsoleKit integration in alpha2.*

*Edit2: Maverick requires a few other tweaks to work properly, updates are <a
href="/archives/2010/12/27/xbmc-suspendresume-in-maverick">here</a>.*

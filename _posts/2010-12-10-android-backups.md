---
id: 397
title: Android Backups
date: 2010-12-10T17:20:20+00:00
author: Matthew Schick
layout: single
guid: http://www.excentral.org/?p=397
permalink: /archives/2010/12/10/android-backups
sent_to_laconica:
  - 'yes'
categories:
  - Life
---
After finally retiring my Symbian phones, I've moved into the world of Android (*cough*Samsung Captivate*cough*) and digging the flexibility.  On thing that always bugged me about my old phones was the lack of a good backup scheme, however with this new beast I've found a relatively easy way requiring only root, three apps and a server with ssh and rsync.  Here's how it works.
<!--more-->
<strong>Apps Required</strong>
<ul>
	<li><a href="http://www.appbrain.com/app/titanium-backup-pro-key-%E2%98%85-root/com.keramidas.TitaniumBackupPro">Titanium Backup Pro</a> - This will backup everything on your phone; apps, contacts, system settings, everything.  It's not free, but the ~$6 (USD) is very much worth while for what it does.  It does require root, I'll leave that to you to get that bit in place.</li>
	<li><a href="http://www.appbrain.com/app/rsync-backup-for-android/eu.kowalczuk.rsync4android">Rsync backup for Android</a> - Does key authentication, has multiple profile support as well as custom rsync params.  Nifty.</li>
	<li><a href="http://www.appbrain.com/app/tasker/net.dinglisch.android.taskerm">Tasker</a> - Used here just to schedule the dumps to the server, however you can do sooooo much more with it.  If you have an Android phone, you want this regardless.</li>
</ul>

<strong>Setup</strong>
First thing you'll want to do is create your target account on your server.  I won't go into great detail here, suffice to say I'd highly recommend using rssh and key auth only for this account (chroot ain't a bad idea either).  You don't want to enable a security risk or allow some $RANDOM to futz with your data.

Once that's done, open the rsync4android app and generate your keypair.  It drops em by default in root of your sdcard directory, best to move em elsewhere (hidden directory) so they aren't quite so easily accessible.  Make sure you have a strong password set for your phone; that keypair will give anyone access to your server account you setup previously so guard as tightly as possible.

Now that you have your keypair, create a new rsync profile.  You'll need to point it to your target host, give it a local directory to sync over as well as a few other options.  In my case I'm just grabbing /sdcard/ which also pulls in the external sd.  I did have to exclude external_sd/.android_secure since the rsync process doesn't run as root (very good thing) by adding '--exclude=external_sd/.android_secure' to the 'Additional rsync options' field.  You could set up various profiles to get a more fine-grained backup of only the unique data, but I'm more interested in keeping a full snapshot.  Once you've got all the bits filled in, save the profile and do a dry run to make sure everything is set up correctly.

To do the initial sync you have a few options.  You can either kick off the full rsync from the phone or sync via usb first to seed the target directories.  Which you choose comes down to the amount of data you have to sync over, in my case I had ~25G to sync so I mounted via usb and did the local rsync to save time and battery.  Either way, make sure you verify you can actually rsync from your phone to the server via wifi before moving on.

Next step will be configuring Titanium to actually run the system backups.  I recommend setting it up with lzo compression, encryption and at least a three backup history.  Once you have those preferences set, hit the 'Schedules' tab and add/edit the list to match how often and which type(s) of data you want to backup.  I'm doing runs (all at 2am) of the 'Backup all new apps & newer versions' type on Monday, Tuesday, Thursday, Friday and Saturday nights. Sunday and Wednesday nights I do full 'Backup all user apps + system data' runs.  Go ahead and run the full backup now so you have some seed data.

<strong>Scheduling and Automation</strong>
So now that we have working backups and syncs, time to pull it together and automate the process.

The rsync4android package includes a Tasker plugin which makes our lives much easier.  I set up a profile with two contexts and a single task; the first context is a simple time schedule (3am) and the second verifies I'm on my home wireless network via the 'Wifi Connected' state.   The task uses the rsync plugin and I've selected the single profile I had setup previously.  If you have multiple rsync profiles you could add them here as well.  I certainly don't want my sync job kicking off if I'm not at home, it'll fail anyway but if you're using a publicly accessible server you could chew through your data plan allowance in a single run if you're not careful.

To test this beast, simply edit the time context to a minute or two ahead of the current time, save it and wait to watch the magic.  Assuming it's successful, make sure you change the time context back to your chosen sync time and enjoy the feeling of superiority over your backup-less comrades and the security of proper remote backups.
#!/bin/sh

# If you're installing by hand, run this as root, and run the daemons from the
# following user accounts.

groupadd lastfm
useradd -g lastfm lastfmsubmitd
useradd -g lastfm lastmp

RUN=/var/run/lastfmsubmitd
CACHE=/var/cache/lastfmsubmitd

mkdir $RUN
mkfifo $RUN/fifo
chown lastfmsubmitd:lastfm $RUN/fifo
chmod 660 $RUN/fifo

mkdir $CACHE
touch $CACHE/subs
chown lastfmsubmitd:lastfm $CACHE/subs
chmod 660 $CACHE/subs
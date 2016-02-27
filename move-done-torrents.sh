#!/usr/bin/env bash
 rsync -rav --exclude="*.part" --remove-source-files /home/ec2-user/temp-media/ /home/plex/awsdrive/Videos

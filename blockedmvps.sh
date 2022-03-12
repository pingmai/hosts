#!/usr/local/bin/bash
set -o errexit -o pipefail

zfiles=`find /var/named/usr/local/etc/namedb -maxdepth 1 \
	-name "zones.blocked*" -a ! -name zones.blocked.mvps`

/usr/local/bin/curl -s https://winhelp2002.mvps.org/hosts.txt |\
	sed -n 's:::; s:^0.0.0.0 \([^ ]*\).*:\1:p' |\
	while read h ; do
		if ! grep -q $h $zfiles; then
			echo "zone \"$h\" { type master; file \"master/null.zone.db\"; };"
		fi
	done


#!/usr/bin/env bash
set -o errexit -o pipefail

curl -s https://winhelp2002.mvps.org/hosts.txt |\
	sed -n 's:::; s:^0.0.0.0 \([^ ]*\).*:zone \"\1\" { type master; file \"master/null.zone.db\"; };:p'


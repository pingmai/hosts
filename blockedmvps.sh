#!/usr/bin/env bash
set -o errexit -o pipefail

curl -s https://winhelp2002.mvps.org/hosts.txt |\
	sed -n 's:

#!/usr/bin/env bash
set -o errexit -o pipefail

dir=$(dirname $(realpath /etc/hosts))
cp -p $dir/hosts $dir/hosts.$(date +%Y%m%d)
cat > $dir/hosts << @EOF
127.0.0.1 localhost^M
::1 localhost #[IPv6]^M

0.0.0.0 secure.rentalcars.com
0.0.0.0 googleanalytics.com
0.0.0.0 view.atdmt.com
0.0.0.0 ad.yieldmanager.com
0.0.0.0 ads.cnn.com
0.0.0.0 liveupdate.gtm.cyberlink.com
0.0.0.0 content.pulse360.com

### Adobe Activation Block
0.0.0.0 3dns-1.adobe.com
0.0.0.0 3dns-2.adobe.com
0.0.0.0 3dns-2.adobe.de
0.0.0.0 3dns-3.adobe.com
0.0.0.0 3dns-3.adobe.de
0.0.0.0 3dns-4.adobe.com
0.0.0.0 3dns.adobe.com
0.0.0.0 CRL.VERISIGN.NET
0.0.0.0 CRL.VERISIGN.NET.*
0.0.0.0 activate-sea.adobe.com
0.0.0.0 activate-sea.adobe.de
0.0.0.0 activate-sjc0.adobe.com
0.0.0.0 activate-sjc0.adobe.de
0.0.0.0 activate.adobe.com
0.0.0.0 activate.adobe.de
0.0.0.0 activate.wip.adobe.com
0.0.0.0 activate.wip1.adobe.com
0.0.0.0 activate.wip2.adobe.com
0.0.0.0 activate.wip3.adobe.com
0.0.0.0 activate.wip3.adobe.de
0.0.0.0 activate.wip4.adobe.com
0.0.0.0 adobe-dns-1.adobe.com
0.0.0.0 adobe-dns-2.adobe.com
0.0.0.0 adobe-dns-2.adobe.de
0.0.0.0 adobe-dns-3.adobe.com
0.0.0.0 adobe-dns-3.adobe.de
0.0.0.0 adobe-dns-4.adobe.com
0.0.0.0 adobe-dns-5.adobe.com
0.0.0.0 adobe-dns.adobe.com
0.0.0.0 adobe-dns.adobe.de
0.0.0.0 adobe.activate.com
0.0.0.0 adobeereg.com
0.0.0.0 crl.verisign.net
0.0.0.0 ereg.adobe.com
0.0.0.0 ereg.adobe.de
0.0.0.0 ereg.wip.adobe.com
0.0.0.0 ereg.wip1.adobe.com
0.0.0.0 ereg.wip2.adobe.com
0.0.0.0 ereg.wip3.adobe.com
0.0.0.0 ereg.wip3.adobe.de
0.0.0.0 ereg.wip4.adobe.com
0.0.0.0 hh-software.com
0.0.0.0 hl2rcv.adobe.com
0.0.0.0 hl2rcv.adobe.de
0.0.0.0 lm.licenses.adobe.com
0.0.0.0 lmlicenses.wip4.adobe.com
0.0.0.0 ood.opsource.net
0.0.0.0 practivate.adobe
0.0.0.0 practivate.adobe.*
0.0.0.0 practivate.adobe.com
0.0.0.0 practivate.adobe.de
0.0.0.0 practivate.adobe.ipp
0.0.0.0 practivate.adobe.newoa
0.0.0.0 practivate.adobe.ntp
0.0.0.0 tss-geotrust-crl.thawte.com
0.0.0.0 wip.adobe.com
0.0.0.0 wip1.adobe.com
0.0.0.0 wip2.adobe.com
0.0.0.0 wip3.adobe.com
0.0.0.0 wip3.adobe.de
0.0.0.0 wip4.adobe.com
0.0.0.0 wwis-dubc1-vip60.adobe.com
0.0.0.0 wwis-dubc1-vip60.adobe.de
0.0.0.0 www.adobeereg.com
0.0.0.0 www.hh-software.com
0.0.0.0 www.wip.adobe.com
0.0.0.0 www.wip1.adobe.com
0.0.0.0 www.wip2.adobe.com
0.0.0.0 www.wip3.adobe.com
0.0.0.0 www.wip4.adobe.com
0.0.0.0 na1r.services.adobe.com
0.0.0.0 hlrcv.stage.adobe.com
### END Adobe Activation Block

`
curl -s https://winhelp2002.mvps.org/hosts.txt |\
	sed -e '1,/Start of entries generated by MVPS HOSTS/d'
`
@EOF
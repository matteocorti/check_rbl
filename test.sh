#!/bin/sh

# Our one non-success exit code.
EXIT_BAD_ARGS=1

if [ $# -lt 1 ]; then
    echo "Usage: $0 <ip address>"
    echo ''
    echo '  <ip address> the IP to check against a bunch of blacklists.'
    echo ''
    exit "${EXIT_BAD_ARGS}"
else
    IP_ADDR="${1}"
fi

perl ./check_rbl -H "${IP_ADDR}" \
    -t 60 \
    -c 1 \
    -w 1 \
    -v \
    -s 0spam-n.fusionzero.com \
    -s 0spam.fusionzero.com \
    -s 0spamtrust.fusionzero.com \
    -s 0spamurl.fusionzero.com \
    -s abuse.spfbl.net \
    -s access.redhawk.org \
    -s all.s5h.net \
    -s all.spamrats.com \
    -s auth.spamrats.com \
    -s b.barracudacentral.org \
    -s backscatter.spameatingmonkey.net \
    -s bb.barracudacentral.org \
    -s bl.0spam.org \
    -s bl.blocklist.de \
    -s bl.deadbeef.com \
    -s bl.konstant.no \
    -s bl.mailspike.net \
    -s bl.nordspam.com \
    -s bl.nosolicitado.org \
    -s bl.scientificspam.net \
    -s bl.spamcop.net \
    -s bl.spameatingmonkey.net \
    -s bl.suomispam.net \
    -s bl.technovision.dk \
    -s bl.worst.nosolicitado.org \
    -s black.dnsbl.brukalai.lt \
    -s black.junkemailfilter.com \
    -s blackholes.five-ten-sg.com \
    -s blacklist.sci.kun.nl \
    -s blacklist.woody.ch \
    -s bsb.spamlookup.net \
    -s cbl.abuseat.org \
    -s combined.abuse.ch \
    -s combined.rbl.msrbl.net \
    -s db.wpbl.info \
    -s dnsbl-1.uceprotect.net \
    -s dnsbl-2.uceprotect.net \
    -s dnsbl-3.uceprotect.net \
    -s dnsbl.antispam.or.id \
    -s dnsbl.beetjevreemd.nl \
    -s dnsbl.dronebl.org \
    -s dnsbl.isx.fr \
    -s dnsbl.justspam.org \
    -s dnsbl.kempt.net \
    -s dnsbl.spfbl.net \
    -s dnsblchile.org \
    -s dnswl.spfbl.net \
    -s drone.abuse.ch \
    -s dsn.rfc-ignorant.org \
    -s duinv.aupads.org \
    -s dyna.spamrats.com \
    -s forbidden.icm.edu.pl \
    -s free.v4bl.org \
    -s gl.suomispam.net \
    -s hil.habeas.com \
    -s images.rbl.msrbl.net \
    -s ip4.bl.zenrbl.pl \
    -s iprbl.mailcleaner.net \
    -s ips.whitelisted.org \
    -s korea.services.net \
    -s krn.korumail.com \
    -s light.dnsbl.brukalai.lt \
    -s list.dnswl.org \
    -s mail-abuse.blacklist.jippg.org \
    -s mtawlrev.dnsbl.rediris.es \
    -s multi.surbl.org \
    -s nbl.0spam.org \
    -s netblockbl.spamgrouper.to \
    -s netscan.rbl.blockedservers.com \
    -s niprbl.mailcleaner.net \
    -s noptr.spamrats.com \
    -s origin.asn.spameatingmonkey.net \
    -s orvedb.aupads.org \
    -s pbl.spamhaus.org \
    -s phishing.rbl.msrbl.net \
    -s postmaster.rfc-ignorant.org \
    -s proxy.bl.gweep.ca \
    -s proxy.block.transip.nl \
    -s psbl.surriel.com \
    -s rbl.abuse.ro \
    -s rbl.blockedservers.com \
    -s rbl.inter.net \
    -s rbl.interserver.net \
    -s rbl.ircbl.org \
    -s rbl.metunet.com \
    -s rbl.rbldns.ru \
    -s rbl.schulte.org \
    -s rbl.spamlab.com \
    -s relays.bl.gweep.ca \
    -s relays.bl.kunden.de \
    -s relays.nether.net \
    -s reputation-ip.rbl.scrolloutf1.com \
    -s reputation-ns.rbl.scrolloutf1.com \
    -s residential.block.transip.nl \
    -s sbl-xbl.spamhaus.org \
    -s sbl.spamdown.org \
    -s sbl.spamhaus.org \
    -s score.spfbl.net \
    -s singular.ttk.pte.hu \
    -s spam.abuse.ch \
    -s spam.pedantic.org \
    -s spam.rbl.blockedservers.com \
    -s spam.rbl.msrbl.net \
    -s spam.spamrats.com \
    -s spambot.bls.digibase.ca \
    -s spamguard.leadmon.net \
    -s spamlist.or.kr \
    -s spamrbl.imp.ch \
    -s spamsources.fabel.dk \
    -s spamtrap.drbl.drand.net \
    -s swl.spamhaus.org \
    -s tor.dan.me.uk \
    -s torexit.dan.me.uk \
    -s truncate.gbudb.net \
    -s ubl.lashback.com \
    -s ubl.unsubscore.com \
    -s unsure.nether.net \
    -s url.0spam.org \
    -s virbl.bit.nl \
    -s virus.rbl.msrbl.net \
    -s wadb.isipp.com \
    -s web.rbl.msrbl.net \
    -s white.dnsbl.brukalai.lt \
    -s whois.rfc-ignorant.org \
    -s wormrbl.imp.ch \
    -s xbl.spamhaus.org \
    -s z.mailspike.net \
    -s zen.spamhaus.org

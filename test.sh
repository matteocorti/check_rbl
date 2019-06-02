#!/bin/sh

# Our one non-success exit code.
EXIT_BAD_ARGS=1

if [ $# -lt 1 ]; then
    echo "Usage: $0 <ip address>"
    echo ''
    echo '  <ip address> the IP to check against a bunch of blacklists.'
    echo ''
    exit $EXIT_BAD_ARGS
else
    IP_ADDR="${1}"
fi



perl ./check_rbl -H $IP_ADDR \
    -t 60 \
    -c 1 \
    -w 1 \
    -v \
    -s cbl.abuseat.org -s bl.deadbeef.com -s spamtrap.drbl.drand.net -s spamsources.fabel.dk -s 0spam.fusionzero.com -s mail-abuse.blacklist.jippg.org -s korea.services.net -s spamguard.leadmon.net -s ix.dnsbl.manitu.net -s relays.nether.net -s psbl.surriel.com -s dyna.spamrats.com -s noptr.spamrats.com -s spam.spamrats.com -s dnsbl.sorbs.net -s spam.dnsbl.sorbs.net -s bl.spamcop.net -s pbl.spamhaus.org -s sbl.spamhaus.org -s xbl.spamhaus.org -s ubl.unsubscore.com -s dnsbl-1.uceprotect.net -s dnsbl-2.uceprotect.net -s dnsbl-3.uceprotect.net -s db.wpbl.info -s access.redhawk.org -s blacklist.sci.kun.nl -s dnsbl.kempt.net -s forbidden.icm.edu.pl -s hil.habeas.com -s rbl.schulte.org -s sbl-xbl.spamhaus.org -s bl.technovision.dk -s b.barracudacentral.org -s dnsbl.antispam.or.id -s dnsbl.inps.de -s drone.abuse.ch -s dsn.rfc-ignorant.org -s dul.dnsbl.sorbs.net -s http.dnsbl.sorbs.net -s l1.spews.dnsbl.sorbs.net -s l2.spews.dnsbl.sorbs.net -s misc.dnsbl.sorbs.net -s postmaster.rfc-ignorant.org -s rbl.spamlab.com -s rbl.suresupport.com -s relays.bl.kunden.de -s smtp.dnsbl.sorbs.net -s socks.dnsbl.sorbs.net -s spam.abuse.ch -s spamrbl.imp.ch -s tr.countries.nerd.dk -s unsure.nether.net -s virbl.bit.nl -s web.dnsbl.sorbs.net -s whois.rfc-ignorant.org -s wormrbl.imp.ch -s zen.spamhaus.org -s zombie.dnsbl.sorbs.net -s blackholes.five-ten-sg.com -s blacklist.woody.ch -s bl.emailbasura.org -s bogons.cymru.com -s combined.abuse.ch -s duinv.aupads.org -s dynip.rothen.com -s ohps.dnsbl.net.au -s omrs.dnsbl.net.au -s orvedb.aupads.org -s osps.dnsbl.net.au -s osrs.dnsbl.net.au -s owfs.dnsbl.net.au -s owps.dnsbl.net.au -s probes.dnsbl.net.au -s proxy.bl.gweep.ca -s proxy.block.transip.nl -s rbl.inter.net -s rbl.megarbl.net -s rdts.dnsbl.net.au -s relays.bl.gweep.ca -s residential.block.transip.nl -s ricn.dnsbl.net.au -s rmst.dnsbl.net.au -s spamlist.or.kr -s t3direct.dnsbl.net.au -s ubl.lashback.com -s all.s5h.net -s dnsbl.anticaptcha.net -s dnsbl.dronebl.org -s dnsbl.spfbl.net -s ips.backscatterer.org -s singular.ttk.pte.hu -s spam.dnsbl.anonmails.de -s spambot.bls.digibase.ca -s z.mailspike.net

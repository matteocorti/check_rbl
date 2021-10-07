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

perl ./check_rbl -H "$IP_ADDR" \
    -t 60 \
    -c 1 \
    -w 1 \
    -v \
    -s cbl.abuseat.org -s spamsources.fabel.dk -s 0spam.fusionzero.com -s mail-abuse.blacklist.jippg.org -s korea.services.net -s spamguard.leadmon.net -s ix.dnsbl.manitu.net -s psbl.surriel.com -s dyna.spamrats.com -s noptr.spamrats.com -s spam.spamrats.com -s dnsbl.sorbs.net -s spam.dnsbl.sorbs.net -s bl.spamcop.net -s pbl.spamhaus.org -s sbl.spamhaus.org -s xbl.spamhaus.org -s dnsbl-1.uceprotect.net -s dnsbl-2.uceprotect.net -s dnsbl-3.uceprotect.net -s db.wpbl.info -s access.redhawk.org -s dnsbl.kempt.net -s rbl.schulte.org -s sbl-xbl.spamhaus.org -s dul.dnsbl.sorbs.net -s misc.dnsbl.sorbs.net -s smtp.dnsbl.sorbs.net -s web.dnsbl.sorbs.net -s zen.spamhaus.org -s zombie.dnsbl.sorbs.net -s dnsbl.dronebl.org -s dnsbl.spfbl.net -s ips.backscatterer.org -s singular.ttk.pte.hu -s spam.dnsbl.anonmails.de -s z.mailspike.net

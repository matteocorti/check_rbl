#!/bin/sh

failures=0

# not all the providers are compliant

echo "Tesing 127.0.0.2: should always be listed"
perl ./check_rbl -H 127.0.0.2 \
    -t 60 \
    -c 37 \
    -w 1 \
    -s cbl.abuseat.org -s spamsources.fabel.dk -s 0spam.fusionzero.com -s mail-abuse.blacklist.jippg.org -s korea.services.net -s spamguard.leadmon.net -s ix.dnsbl.manitu.net -s psbl.surriel.com -s dyna.spamrats.com -s noptr.spamrats.com -s spam.spamrats.com -s dnsbl.sorbs.net -s spam.dnsbl.sorbs.net -s bl.spamcop.net -s pbl.spamhaus.org -s sbl.spamhaus.org -s xbl.spamhaus.org -s dnsbl-1.uceprotect.net -s dnsbl-2.uceprotect.net -s dnsbl-3.uceprotect.net -s db.wpbl.info -s access.redhawk.org -s dnsbl.kempt.net -s rbl.schulte.org -s sbl-xbl.spamhaus.org -s dul.dnsbl.sorbs.net -s misc.dnsbl.sorbs.net -s smtp.dnsbl.sorbs.net -s web.dnsbl.sorbs.net -s zen.spamhaus.org -s zombie.dnsbl.sorbs.net -s dnsbl.dronebl.org -s dnsbl.spfbl.net -s ips.backscatterer.org -s singular.ttk.pte.hu -s spam.dnsbl.anonmails.de -s z.mailspike.net

if [ $? -ne 2 ] ; then
    echo "   failed"
    failures=$(( failures + 1 ))
else
    echo "   success"
fi

echo "Testing 127.0.0.1: should never be listed"
perl ./check_rbl -H 127.0.0.1 \
    -t 60 \
    -c 38 \
    -w 1 \
    -s cbl.abuseat.org -s spamsources.fabel.dk -s 0spam.fusionzero.com -s mail-abuse.blacklist.jippg.org -s korea.services.net -s spamguard.leadmon.net -s ix.dnsbl.manitu.net -s psbl.surriel.com -s dyna.spamrats.com -s noptr.spamrats.com -s spam.spamrats.com -s dnsbl.sorbs.net -s spam.dnsbl.sorbs.net -s bl.spamcop.net -s pbl.spamhaus.org -s sbl.spamhaus.org -s xbl.spamhaus.org -s dnsbl-1.uceprotect.net -s dnsbl-2.uceprotect.net -s dnsbl-3.uceprotect.net -s db.wpbl.info -s access.redhawk.org -s dnsbl.kempt.net -s rbl.schulte.org -s sbl-xbl.spamhaus.org -s dul.dnsbl.sorbs.net -s misc.dnsbl.sorbs.net -s smtp.dnsbl.sorbs.net -s web.dnsbl.sorbs.net -s zen.spamhaus.org -s zombie.dnsbl.sorbs.net -s dnsbl.dronebl.org -s dnsbl.spfbl.net -s ips.backscatterer.org -s singular.ttk.pte.hu -s spam.dnsbl.anonmails.de -s z.mailspike.net

# shellcheck disable=SC2181
if [ $? -ne 0 ] ; then
    echo "   failed"
    failures=$(( failures + 1 ))
else
    echo "   success"
fi

echo "Testing ::2: should always be listed"
perl ./check_rbl -H ::2 \
    -t 60 \
    -c 1 \
    -w 1 \
    -s list.dnswl.org

if [ $? -ne 2 ] ; then
    echo "   failed"
    failures=$(( failures + 1 ))
else
    echo "   success"
fi

echo "Testing ::1: should never be listed"
perl ./check_rbl -H ::1 \
    -t 60 \
    -c 1 \
    -w 1 \
    -s list.dnswl.org

# shellcheck disable=SC2181
if [ $? -ne 0 ] ; then
    echo "   failed"
    failures=$(( failures + 1 ))
else
    echo "   success"
fi

if [ "${failures}" -gt 0 ] ; then
    echo "${failures} tests failed"
    exit 1
else
    echo "tests OK"
fi


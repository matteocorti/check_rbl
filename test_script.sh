#!/bin/sh

failures=0

servers="cbl.abuseat.org spamsources.fabel.dk mail-abuse.blacklist.jippg.org korea.services.net ix.dnsbl.manitu.net psbl.surriel.com dyna.spamrats.com noptr.spamrats.com spam.spamrats.com dnsbl.sorbs.net spam.dnsbl.sorbs.net bl.spamcop.net pbl.spamhaus.org sbl.spamhaus.org xbl.spamhaus.org db.wpbl.info access.redhawk.org dnsbl.kempt.net rbl.schulte.org sbl-xbl.spamhaus.org smtp.dnsbl.sorbs.net web.dnsbl.sorbs.net zen.spamhaus.org zombie.dnsbl.sorbs.net dnsbl.dronebl.org dnsbl.spfbl.net ips.backscatterer.org spam.dnsbl.anonmails.de z.mailspike.net"

# build the command line options
options=''
for s in ${servers} ; do
    options="${options} -s ${s}"
done

##############################################################################

echo "Testing 127.0.0.2: should always be listed"
perl ./check_rbl -H 127.0.0.2 -t 60 -c 29 -w 1 ${options}

if [ $? -ne 2 ]; then
    echo "  failed"
    failures=$((failures + 1))
    for s in ${servers}; do
        perl ./check_rbl -H 127.0.0.2 -t 60 -c 30 -w 1 -s ${s} > /dev/null
        if [ $? -eq 0 ]; then
            echo "    not listed on ${s}"
        fi
    done
             
else
    echo "   success"
fi

##############################################################################

echo "Testing 127.0.0.1: should never be listed"
perl ./check_rbl -H 127.0.0.1 -t 60 -c 38 -w 1 ${options}

# shellcheck disable=SC2181
if [ $? -ne 0 ]; then
    echo "  failed"
    failures=$((failures + 1))
else
    echo "  success"
fi

##############################################################################

echo "Testing ::2: should always be listed"
perl ./check_rbl -H ::2 -t 60 -c 1 -w 1 -s list.dnswl.org

if [ $? -ne 2 ]; then
    echo "  failed"
    failures=$((failures + 1))
else
    echo "  success"
fi

##############################################################################

echo "Testing ::1: should never be listed"
perl ./check_rbl -H ::1 -t 60 -c 1 -w 1 -s list.dnswl.org

# shellcheck disable=SC2181
if [ $? -ne 0 ]; then
    echo "  failed"
    failures=$((failures + 1))
else
    echo "  success"
fi

##############################################################################

if [ "${failures}" -gt 0 ]; then
    echo "${failures} tests failed"
    exit 1
else
    echo "tests OK"
fi

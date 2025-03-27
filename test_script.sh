#!/bin/sh

failures=0

# smaller set of working servers
# servers="cbl.abuseat.org spamsources.fabel.dk mail-abuse.blacklist.jippg.org korea.services.net psbl.surriel.com dyna.spamrats.com noptr.spamrats.com spam.spamrats.com bl.spamcop.net pbl.spamhaus.org sbl.spamhaus.org xbl.spamhaus.org db.wpbl.info access.redhawk.org dnsbl.kempt.net rbl.schulte.org sbl-xbl.spamhaus.org zen.spamhaus.org dnsbl.dronebl.org dnsbl.spfbl.net z.mailspike.net"

servers="0spam-n.fusionzero.com 0spam.fusionzero.com 0spamtrust.fusionzero.com 0spamurl.fusionzero.com abuse.spfbl.net access.redhawk.org all.s5h.net all.spamrats.com auth.spamrats.com b.barracudacentral.org backscatter.spameatingmonkey.net bb.barracudacentral.org bl.0spam.org bl.blocklist.de bl.deadbeef.com bl.konstant.no bl.mailspike.net bl.nordspam.com bl.nosolicitado.org bl.scientificspam.net bl.spamcop.net bl.spameatingmonkey.net bl.suomispam.net bl.technovision.dk bl.worst.nosolicitado.org black.dnsbl.brukalai.lt black.junkemailfilter.com blackholes.five-ten-sg.com blacklist.sci.kun.nl blacklist.woody.ch bsb.spamlookup.net cbl.abuseat.org combined.abuse.ch combined.rbl.msrbl.net db.wpbl.info dnsbl-1.uceprotect.net dnsbl-2.uceprotect.net dnsbl-3.uceprotect.net dnsbl.antispam.or.id dnsbl.beetjevreemd.nl dnsbl.dronebl.org dnsbl.isx.fr dnsbl.justspam.org dnsbl.kempt.net dnsbl.spfbl.net dnsblchile.org dnswl.spfbl.net drone.abuse.ch dsn.rfc-ignorant.org duinv.aupads.org dyna.spamrats.com forbidden.icm.edu.pl free.v4bl.org gl.suomispam.net hil.habeas.com images.rbl.msrbl.net ip4.bl.zenrbl.pl iprbl.mailcleaner.net ips.whitelisted.org korea.services.net krn.korumail.com light.dnsbl.brukalai.lt list.dnswl.org mail-abuse.blacklist.jippg.org mtawlrev.dnsbl.rediris.es multi.surbl.org nbl.0spam.org netblockbl.spamgrouper.to netscan.rbl.blockedservers.com niprbl.mailcleaner.net noptr.spamrats.com origin.asn.spameatingmonkey.net orvedb.aupads.org pbl.spamhaus.org phishing.rbl.msrbl.net postmaster.rfc-ignorant.org proxy.bl.gweep.ca proxy.block.transip.nl psbl.surriel.com rbl.abuse.ro rbl.blockedservers.com rbl.inter.net rbl.interserver.net rbl.ircbl.org rbl.metunet.com rbl.rbldns.ru rbl.schulte.org rbl.spamlab.com relays.bl.gweep.ca relays.bl.kunden.de relays.nether.net reputation-ip.rbl.scrolloutf1.com reputation-ns.rbl.scrolloutf1.com residential.block.transip.nl sbl-xbl.spamhaus.org sbl.spamdown.org sbl.spamhaus.org score.spfbl.net singular.ttk.pte.hu spam.abuse.ch spam.pedantic.org spam.rbl.blockedservers.com spam.rbl.msrbl.net spam.spamrats.com spambot.bls.digibase.ca spamguard.leadmon.net spamlist.or.kr spamrbl.imp.ch spamsources.fabel.dk swl.spamhaus.org tor.dan.me.uk torexit.dan.me.uk truncate.gbudb.net ubl.lashback.com ubl.unsubscore.com unsure.nether.net url.0spam.org virbl.bit.nl virus.rbl.msrbl.net wadb.isipp.com web.rbl.msrbl.net white.dnsbl.brukalai.lt whois.rfc-ignorant.org wormrbl.imp.ch xbl.spamhaus.org z.mailspike.net zen.spamhaus.org"

# build the command line options
options=''
for s in ${servers} ; do
    options="${options} -s ${s}"
done

##############################################################################

echo "Testing 127.0.0.2: should always be listed"

# shellcheck disable=SC2086 # ${option} can be empty and should be split if not
perl ./check_rbl -H 127.0.0.2 -t 60 -c 29 -w 1 ${options}

if [ $? -ne 2 ]; then
    echo "  failed"
    failures=$((failures + 1))
    for s in ${servers}; do
        if perl ./check_rbl -H 127.0.0.2 -t 60 -c 30 -w 1 -s "${s}" > /dev/null ; then
            echo "    not listed on ${s}"
        fi
    done
else
    echo "   success"
fi

##############################################################################

echo "Testing 127.0.0.1: should never be listed"

# shellcheck disable=SC2086 # ${option} can be empty and should be split if not
if ! perl ./check_rbl -H 127.0.0.1 -t 60 -c 38 -w 1 ${options} ; then
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

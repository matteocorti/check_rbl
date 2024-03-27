#!/bin/sh

failures=0

# smaller set of working servers
# servers="cbl.abuseat.org spamsources.fabel.dk mail-abuse.blacklist.jippg.org korea.services.net ix.dnsbl.manitu.net psbl.surriel.com dyna.spamrats.com noptr.spamrats.com spam.spamrats.com dnsbl.sorbs.net spam.dnsbl.sorbs.net bl.spamcop.net pbl.spamhaus.org sbl.spamhaus.org xbl.spamhaus.org db.wpbl.info access.redhawk.org dnsbl.kempt.net rbl.schulte.org sbl-xbl.spamhaus.org smtp.dnsbl.sorbs.net web.dnsbl.sorbs.net zen.spamhaus.org zombie.dnsbl.sorbs.net dnsbl.dronebl.org dnsbl.spfbl.net spam.dnsbl.anonmails.de z.mailspike.net"

servers="0spam-n.fusionzero.com 0spam.fusionzero.com 0spamtrust.fusionzero.com 0spamurl.fusionzero.com abuse.spfbl.net access.redhawk.org all.s5h.net all.spamrats.com aspews.ext.sorbs.net auth.spamrats.com b.barracudacentral.org backscatter.spameatingmonkey.net bb.barracudacentral.org bl.0spam.org bl.blocklist.de bl.deadbeef.com bl.konstant.no bl.mailspike.net bl.nordspam.com bl.nosolicitado.org bl.scientificspam.net bl.score.senderscore.com bl.spamcop.net bl.spameatingmonkey.net bl.suomispam.net bl.technovision.dk bl.worst.nosolicitado.org black.dnsbl.brukalai.lt black.junkemailfilter.com blackholes.five-ten-sg.com blacklist.sci.kun.nl blacklist.woody.ch block.dnsbl.sorbs.net bsb.spamlookup.net cbl.abuseat.org cidr.bl.mcafee.com combined.abuse.ch combined.rbl.msrbl.net db.wpbl.info dnsbl-1.uceprotect.net dnsbl-2.uceprotect.net dnsbl-3.uceprotect.net dnsbl.antispam.or.id dnsbl.beetjevreemd.nl dnsbl.dronebl.org dnsbl.isx.fr dnsbl.justspam.org dnsbl.kempt.net dnsbl.madavi.de dnsbl.sorbs.net dnsbl.spfbl.net dnsblchile.org dnswl.spfbl.net drone.abuse.ch dsn.rfc-ignorant.org duinv.aupads.org dul.dnsbl.sorbs.net dyna.spamrats.com escalations.dnsbl.sorbs.net forbidden.icm.edu.pl free.v4bl.org gl.suomispam.net hil.habeas.com http.dnsbl.sorbs.net images.rbl.msrbl.net ip4.bl.zenrbl.pl iprbl.mailcleaner.net ips.whitelisted.org ix.dnsbl.manitu.net korea.services.net krn.korumail.com l1.spews.dnsbl.sorbs.net l2.bbfh.ext.sorbs.net l2.spews.dnsbl.sorbs.net light.dnsbl.brukalai.lt list.dnswl.org mail-abuse.blacklist.jippg.org misc.dnsbl.sorbs.net mtawlrev.dnsbl.rediris.es multi.surbl.org nbl.0spam.org netblockbl.spamgrouper.to netscan.rbl.blockedservers.com new.spam.dnsbl.sorbs.net niprbl.mailcleaner.net noptr.spamrats.com old.spam.dnsbl.sorbs.net origin.asn.spameatingmonkey.net orvedb.aupads.org pbl.spamhaus.org phishing.rbl.msrbl.net plus.bondedsender.org postmaster.rfc-ignorant.org problems.dnsbl.sorbs.net proxies.dnsbl.sorbs.net proxy.bl.gweep.ca proxy.block.transip.nl psbl.surriel.com query.bondedsender.org rbl.abuse.ro rbl.blockedservers.com rbl.inter.net rbl.interserver.net rbl.ircbl.org rbl.lugh.ch rbl.metunet.com rbl.rbldns.ru rbl.schulte.org rbl.spamlab.com recent.spam.dnsbl.sorbs.net relays.bl.gweep.ca relays.bl.kunden.de relays.dnsbl.sorbs.net relays.nether.net rep.mailspike.net reputation-ip.rbl.scrolloutf1.com reputation-ns.rbl.scrolloutf1.com residential.block.transip.nl safe.dnsbl.sorbs.net sbl-xbl.spamhaus.org sbl.spamdown.org sbl.spamhaus.org score.spfbl.net singular.ttk.pte.hu smtp.dnsbl.sorbs.net socks.dnsbl.sorbs.net spam.abuse.ch spam.dnsbl.anonmails.de spam.dnsbl.sorbs.net spam.pedantic.org spam.rbl.blockedservers.com spam.rbl.msrbl.net spam.spamrats.com spambot.bls.digibase.ca spamguard.leadmon.net spamlist.or.kr spamrbl.imp.ch spamsources.fabel.dk swl.spamhaus.org tor.dan.me.uk torexit.dan.me.uk truncate.gbudb.net ubl.lashback.com ubl.unsubscore.com unsure.nether.net url.0spam.org virbl.bit.nl virus.rbl.msrbl.net wadb.isipp.com web.dnsbl.sorbs.net web.rbl.msrbl.net white.dnsbl.brukalai.lt whois.rfc-ignorant.org wl.mailspike.net wormrbl.imp.ch xbl.spamhaus.org z.mailspike.net zen.spamhaus.org zombie.dnsbl.sorbs.net"

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

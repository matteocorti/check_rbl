
 &copy; Matteo Corti, ETH Zurich, 2009-2012

 &copy; Matteo Corti, 2009-2021

  see AUTHORS for the complete list of contributors

# check\_rbl

A Nagios plugin to check if an SMTP server is blacklisted

## Note

Some blacklister as Spamhaus ban DNS queries from public DNS
resolvers as Google resulting in no host being listed. If you are
experiencing problems with the plugin just try the DNS query with a
tool as nslookup to check your DNS configuration.

## Known bugs and problems

Needs ```Data::Validate::Domain``` 0.12 to handle fully qualified host names with an ending dot (e.g., "example.org.")

## Example

```
check_rbl -H example.org -t 60 -c 1 -w 1 -s cbl.abuseat.org -s bl.deadbeef.com -s spamtrap.drbl.drand.net -s spamsources.fabel.dk -s 0spam.fusionzero.com -s mail-abuse.blacklist.jippg.org -s korea.services.net -s spamguard.leadmon.net -s ix.dnsbl.manitu.net -s relays.nether.net -s psbl.surriel.com -s dyna.spamrats.com -s noptr.spamrats.com -s spam.spamrats.com -s dnsbl.sorbs.net -s spam.dnsbl.sorbs.net -s bl.spamcop.net -s pbl.spamhaus.org -s sbl.spamhaus.org -s xbl.spamhaus.org -s ubl.unsubscore.com -s db.wpbl.info -s access.redhawk.org -s blacklist.sci.kun.nl -s dnsbl.kempt.net -s forbidden.icm.edu.pl -s hil.habeas.com -s rbl.schulte.org -s sbl-xbl.spamhaus.org -s bl.technovision.dk -s b.barracudacentral.org -s dnsbl.antispam.or.id -s drone.abuse.ch -s dsn.rfc-ignorant.org -s dul.dnsbl.sorbs.net -s http.dnsbl.sorbs.net -s l1.spews.dnsbl.sorbs.net -s l2.spews.dnsbl.sorbs.net -s misc.dnsbl.sorbs.net -s postmaster.rfc-ignorant.org -s rbl.spamlab.com -s relays.bl.kunden.de -s smtp.dnsbl.sorbs.net -s socks.dnsbl.sorbs.net -s spam.abuse.ch -s spamrbl.imp.ch -s tr.countries.nerd.dk -s unsure.nether.net -s virbl.bit.nl -s web.dnsbl.sorbs.net -s whois.rfc-ignorant.org -s wormrbl.imp.ch -s zen.spamhaus.org -s zombie.dnsbl.sorbs.net -s blackholes.five-ten-sg.com -s blacklist.woody.ch -s bogons.cymru.com -s combined.abuse.ch -s duinv.aupads.org -s ohps.dnsbl.net.au -s omrs.dnsbl.net.au -s orvedb.aupads.org -s osps.dnsbl.net.au -s osrs.dnsbl.net.au -s owfs.dnsbl.net.au -s owps.dnsbl.net.au -s probes.dnsbl.net.au -s proxy.bl.gweep.ca -s proxy.block.transip.nl -s rbl.inter.net -s rdts.dnsbl.net.au -s relays.bl.gweep.ca -s residential.block.transip.nl -s ricn.dnsbl.net.au -s rmst.dnsbl.net.au -s spamlist.or.kr -s t3direct.dnsbl.net.au -s ubl.lashback.com -s all.s5h.net -s dnsbl.dronebl.org -s dnsbl.spfbl.net -s ips.backscatterer.org -s singular.ttk.pte.hu -s spam.dnsbl.anonmails.de -s spambot.bls.digibase.ca -s z.mailspike.net
```

### See also

[Comparison of DNS blacklists](https://en.wikipedia.org/wiki/Comparison_of_DNS_blacklists) on Wikipedia for a list.

## Bugs
Please report any bugs or feature requests through the
web interface at [https://github.com/matteocorti/check_rbl/issues](https://github.com/matteocorti/check_rbl/issues)

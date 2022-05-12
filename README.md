
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
check_rbl -H example.org -t 60 -c 1 -w 1 -s cbl.abuseat.org -s spamsources.fabel.dk -s mail-abuse.blacklist.jippg.org -s korea.services.net -s ix.dnsbl.manitu.net -s psbl.surriel.com -s dyna.spamrats.com -s noptr.spamrats.com -s spam.spamrats.com -s dnsbl.sorbs.net -s spam.dnsbl.sorbs.net -s bl.spamcop.net -s pbl.spamhaus.org -s sbl.spamhaus.org -s xbl.spamhaus.org -s db.wpbl.info -s access.redhawk.org -s dnsbl.kempt.net -s rbl.schulte.org -s sbl-xbl.spamhaus.org -s smtp.dnsbl.sorbs.net -s web.dnsbl.sorbs.net -s zen.spamhaus.org -s zombie.dnsbl.sorbs.net -s dnsbl.dronebl.org -s dnsbl.spfbl.net -s ips.backscatterer.org -s spam.dnsbl.anonmails.de -s z.mailspike.net
```

### See also

[Comparison of DNS blacklists](https://en.wikipedia.org/wiki/Comparison_of_DNS_blacklists) on Wikipedia for a list.

## Bugs
Please report any bugs or feature requests through the
web interface at [https://github.com/matteocorti/check_rbl/issues](https://github.com/matteocorti/check_rbl/issues)

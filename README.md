
 &copy; Matteo Corti, ETH Zurich, 2009-2012

 &copy; Matteo Corti, 2009-2025

  see AUTHORS for the complete list of contributors

![](https://img.shields.io/github/v/release/matteocorti/check_rbl@)&nbsp;![](https://img.shields.io/github/downloads/matteocorti/check_rbl/latest/total)&nbsp;![](https://img.shields.io/github/downloads/matteocorti/check_rbl/total)&nbsp;![](https://img.shields.io/github/license/matteocorti/check_rbl)&nbsp;![](https://img.shields.io/github/stars/matteocorti/check_rbl)&nbsp;![](https://img.shields.io/github/forks/matteocorti/check_rbl)

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
check_rbl -H example.org -t 60 -c 1 -w 1 -s cbl.abuseat.org -s spamsources.fabel.dk -s mail-abuse.blacklist.jippg.org -s korea.services.net -s psbl.surriel.com -s dyna.spamrats.com -s noptr.spamrats.com -s spam.spamrats.com -s bl.spamcop.net -s pbl.spamhaus.org -s sbl.spamhaus.org -s xbl.spamhaus.org -s db.wpbl.info -s access.redhawk.org -s dnsbl.kempt.net -s rbl.schulte.org -s sbl-xbl.spamhaus.org -s zen.spamhaus.org -s dnsbl.dronebl.org -s dnsbl.spfbl.net -s z.mailspike.net
```

### See also

[Comparison of DNS blacklists](https://en.wikipedia.org/wiki/Comparison_of_DNS_blacklists) on Wikipedia for a list.

## Bugs
Please report any bugs or feature requests through the
web interface at [https://github.com/matteocorti/check_rbl/issues](https://github.com/matteocorti/check_rbl/issues)

# GeoIP Lists
This repository contains CIDR (Classless Inter-Domain Routing) lists organized by geographical regions for routing VPNs in my router.

## Data Source

- Primary data: [MaxMind GeoLite2](https://dev.maxmind.com/geoip/geolite2-free-geolocation-data)
- Updated via: [https://mailfud.org/geoip-legacy/](https://mailfud.org/geoip-legacy/)

## Features

- Lists filtered by regions: US, Europe, CIS, Russia, China
- Separated by IPv4 and IPv6
- Subnets merged for a little bit of compression
- All subnets presented in CIDR format
- Run [generate.fish](https://github.com/antonme/GeoIP/blob/master/generate.fish) to update the data manually; it is easily configurable to change/add regions that you may want

## License
As these lists are based on a database originating from MaxMind GeoLite2 data, it is implied that the original GeoLite2 End User License Agreement may apply to them too.

Please see: https://www.maxmind.com/en/geolite2/eula

Any scripts here may be used as you see fit.

## Sister repos
Here's list of another data I use for my router configs:
  * [ipnames](https://github.com/antonme/ipnames): daily updated list of FQDNs and resolved IPs of some popular sites/platforms. Made for routing of some VPNs in my router
  * [ipranges](https://github.com/antonme/ipranges): list IP ranges of: Google, Bing, Amazon, Microsoft, Azure, Oracle, DigitalOcean, GitHub, Facebook, Twitter, Linode, Yandex, Vkontakte with regular auto-updates

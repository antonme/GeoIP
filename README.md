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

## License
As these lists based on database that originate from MaxMind GeoLite2 data, it is implied that the original GeoLite2 End User License Agreement may apply to them too.
Please see: https://www.maxmind.com/en/geolite2/eula

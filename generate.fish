function prepare
	rm GeoIP-legacy.csv.gz 2>/dev/null
	echo "### Preparing data"
	echo "    Downloading GeoIP csv"
	curl -s https://mailfud.org/geoip-legacy/GeoIP-legacy.csv.gz -o GeoIP-legacy.csv.gz

	rm GeoIP-legacy.csv
	echo "    Extracting csv"
	gunzip GeoIP-legacy.csv.gz

	echo "    Generating sublists for ipv4 and ipv6"
	cat GeoIP-legacy.csv | rg -v ":" >GeoIP-ipv4.csv
	cat GeoIP-legacy.csv | rg ":" >GeoIP-ipv6.csv
	rm GeoIP-legacy.csv
end


function generate-ips

	set name $argv[1]
	echo
	echo    "### Generating lists for $name"
	echo -n "    Filtering ipv6s.."
	cat GeoIP-ipv6.csv| rg "$searchline" |awk -F',' '{ff=substr($2,length($1)-1,length($2)-length($1)+1); gsub(/:/, "", ff);lln=((128-length(ff)*4));print substr($1,2,length($1)-2)"/"lln;}'>$name.ipv6.cidr


	echo " Merging ipv6s.."
	python utils/merge.py --source $name.ipv6.cidr >$name.ipv6.cidr.txt

	echo -n "    Filtering ipv4s.."
	cat GeoIP-ipv4.csv| rg "$searchline"|awk -F',' '{print substr($1,2,length($1)-2)" "substr($2,2,length($2)-2)}'|python utils/ipcalc.py >$name.ipv4.cidr

	echo " Merging ipv4s.."
	python utils/merge.py --source $name.ipv4.cidr >$name.ipv4.cidr.txt

    rm *.cidr
end
#set DATE $(date "+%y%m%d-%H%M")
#mv GeoIP-legacy.csv GeoIP-legacy.$DATE.csv

prepare

# Europe as per https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Glossary:Country_codes
generate-ips europe "AT|BA|LI|CH|SI|SK|MT|BE|BG|HR|CY|CZ|DK|EE|FI|FR|DE|GR|HU|IE|IT|LV|LT|LU|MT|NL|PL|PT|RO|SK|SI|ES|SE|IS|LI|NO|CH|AL|BA|MD|ME|MK|RS|TR|UA|XK|MC|SM|GB|VA"
generate-ips russia "RU"

# CIS as per https://worldpopulationreview.com/country-rankings/cis-countries
generate-ips cis "RU|BY|KZ|KG|AM|AZ|MD|TJ|UZ"
generate-ips us "US"
generate-ips cn "CN|HK|MO"

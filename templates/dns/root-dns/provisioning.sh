#!/bin/bash

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y bind9

cat > /etc/bind/named.conf.options << EOL
options {
	directory "/var/cache/bind";

	forwarders {
		1.1.1.1;
		80.67.169.12;
		80.67.169.40;
	};

	dnssec-validation auto;
};
EOL

cat >> /etc/bind/named.conf.local << EOL
zone "netexplore.net" {
	type master;
	file "/etc/bind/db.netexplore.net";
};
EOL

cat > /etc/bind/db.netexplore.net << EOL
\$TTL	86400
netexplore.net.	IN	SOA	localhost. root.localhost. (
			      1		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			  86400 )	; Negative Cache TTL
;
netexplore.net.	IN	NS	localhost.
netexplore.net.	IN	A	42.42.42.42
EOL

systemctl restart bind9
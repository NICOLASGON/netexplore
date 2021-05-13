#!/bin/sh

ip a add 10.0.1.2/24 dev eth1

cat > /etc/nginx/http.d/default.conf << EOL
server {
	listen 80 default_server;
	listen [::]:80 default_server;
    root /var/www;
}
EOL

cat > /var/www/index.html << EOL
<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Titre de la page</title>
  <link rel="stylesheet" href="style.css">
  <script src="script.js"></script>
</head>
<body>
    <h1>Webserver 1</h1>
</body>
</html>
EOL

service nginx reload
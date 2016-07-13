Gandi LiveDNS beta script
===========================

Prequisites
-----------------
- a server with php
- a gandi beta account on http://beta.gandi.net
- a domain name using `ns1.gandi.net` aa nameserver
- a zone associated to that domain (follow instructions on http://doc.livedns.gandi.net/)

Howto
---------
- place my-ip.php on some public server
- copy config.dist to config and modify values
- cron the bash script, for example
  `*/10 * * * * cd $HOME/projects/gandyndns && ./refresh_IP.sh`

Warning
-------------
This is a hacky script I use for my own convenience, there is no guarantee it's gonna work for you.

You can tune it to use some public service or some other way to retrieve your current IP address.

Just get the script and modify it as you want. That's just a script.

Author
---------------
- mose

License
------------
This piece of script is Public Domain.

#!/bin/bash

cat <<EOF

REFS 
----
  For adlist sqlite3 schema docs: 	- https://docs.pi-hole.net/database/gravity/?h=adlist#adlist-table-adlist
  Main pi-hole website			- https://pi-hole.net/
  pi-hole github repo			- https://github.com/pi-hole/pi-hole


Exporting
---------
$ sqlite3 /etc/pihole/gravity.db -header -csv 'select * from adlist' > ~/adlist.csv

-or-

$ dump_adlist


Viewing
-------
$ sed 's/,/ ,/g' ~/adlist.csv | column -t -s, | less -S 

-or-

$ view_adlist

EOF

alias dump_adlist="sqlite3 /etc/pihole/gravity.db -header -csv 'select * from adlist' > ~/adlist.csv"
alias view_adlist="more ~/adlist.csv | sed 's/,/ ,/g' | column -t -s, | less -S"

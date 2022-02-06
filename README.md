# Pi-hole (v5.x+) AdList + Mgmt Helpers
Repo includes my latest up to date AdList (.csv) along with several helper commands (Bash aliases) I use to add/export/delete AdList URLs to Pi-hole's v5.x SQLite DB.


# Aliases
The main file in the repo, `pihole_adlist_helpers.sh` can be simply sourced to activate the helper aliases:
```
$ . pihole_adlist_helpers.sh
```

Once active it provides you with the following alises:
```
$ dump_adlist
$ view_adlist
```

**NOTE:** `dump_adlist` dumps the contents of the AdList (URLs of the lists themselves NOT the blocked URLs). These get dumped into a file `~/adlist.csv`. To view this CSV file use `view_adlist`.

Example of the output from `view_adlist`:
```
$ view_adlist
id    address                                                                                                                                   enabled   date_add
1     https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts                                                                          1         15896528
2     https://mirror1.malwaredomains.com/files/justdomains                                                                                      0         15896528
4     https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt                                                                          1         15896528
5     https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt                                                                                1         15896528
9     https://v.firebog.net/hosts/BillStearns.txt                                                                                               1         15896528
10    https://v.firebog.net/hosts/static/w3kbl.txt                                                                                              1         15896528
11    https://reddestdream.github.io/Projects/MinimalHosts/etc/MinimalHostsBlocker/minimalhosts                                                 1         15896528
14    https://raw.githubusercontent.com/StevenBlack/hosts/master/data/KADhosts/hosts                                                            1         15896528
15    https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.Spam/hosts                                                            1         15896528
18    http://sysctl.org/cameleon/hosts                                                                                                          1         15896528
21    https://www.joewein.net/dl/bl/dom-bl-base.txt                                                                                             1         15896528
22    https://raw.githubusercontent.com/matomo-org/referrer-spam-blacklist/master/spammers.txt                                                  1         15896528
23    https://hostsfile.org/Downloads/hosts.txt                                                                                                 1         15896528
...
...
```

# Predecessor AdList work for Pi-hole (v4.x)
I also maintained a v4.x AdList for older versions of Pi-hole but at this point (1/2022) it's considered deprecated since I don't maintain any v4.x Pi-hole gear any longer. If you're looking for that list it's here:
- https://gist.github.com/slmingol/f6b1d5ab852cdd1a2f4a499c3010db2d


# References
- [For adlist sqlite3 schema docs](https://docs.pi-hole.net/database/gravity/?h=adlist#adlist-table-adlist)
- [Main pi-hole website](https://pi-hole.net/)
- [pi-hole github repo]()https://github.com/pi-hole/pi-hole)
- [Pretty CSV viewing on the Command Line](https://www.stefaanlippens.net/pretty-csv.html)

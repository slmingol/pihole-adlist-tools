# Pi-hole (v5.x & v6.x+) AdList + Mgmt Helpers
Repo includes my latest up to date AdList (.csv) along with several helper commands (Bash aliases) I use to add/export/delete AdList URLs to Pi-hole's v5.x & v6.x SQLite DBs.


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


# Adding & Deleting from AdList
I currently don't include any aliaes to "manage" the AdList but you can construct the necessary `sqlite3` commands from this thread titled: [How do I add list via cli](https://discourse.pi-hole.net/t/how-do-i-add-list-via-cli/43733) in the Pi-hole Discourse. Specifically:


### Add
```
$ sudo sqlite3 /etc/pihole/gravity.db "INSERT INTO adlist (address, enabled, comment) VALUES ('https://domain.com/blocklist.txt', 1, 'comment');"
```

-or-

...WIP...
```
for i in $(awk -F, '{print $2}' ~/adlist.csv);do 
   B="'$i'"; 
   sqlite3 /etc/pihole/gravity.db "INSERT INTO adlist (address, enabled, comment) VALUES ("$i", 1, 'comment');";
done
```

### Delete
```
$ TBD
```


# 3rd Party Things
Lastly if you're looking for even more tooling the community has a wealth of tools to help manage AdList and analyze your list's effectiveness/usefulness.

- [pihole5-list-tool](https://github.com/jessedp/pihole5-list-tool)

    > This tool provides bulk operations to manage your Pi-hole 5 Allow lists and Block/Ad lists.


- [Which adlists do you really need? Here is the answer (Script)](https://discourse.pi-hole.net/t/which-adlists-do-you-really-need-here-is-the-answer-script/32181)
- [Pihole Adlist Tool](https://github.com/yubiuser/pihole_adlist_tool)

    > This script tries to provide you with a bunch of information that enables you to decide which adlists you need based on your browsing behavior. It does that by matching your browsing history (FTL's querylog) with your current adlist configuration (gravity database) generating a list of domains that you have visited in the past and which would have been blocked if your current adlist configuration would have been in place back then. In a second step the scripts takes this list and attributes each domain to the adlists it is on (similar to what pihole -q does). The final output is a table of all your adlists with the corresponding number of covered domains (domains that you have visited and that would have been blocked if only this particular adlist would have been used).


- [Delete all adlists and whitelists in one step possible](https://discourse.pi-hole.net/t/delete-all-adlists-and-whitelists-in-one-step-possible/39522)

    > I run pi-hole (Pi-hole v5.1.2) on a raspberry pi since a couple of months. Basically I'm pretty satisfied.  Just wonder if there's a way to delete


- [Update Pi-hole's lists from remote sources](https://opensourcelibs.com/lib/pihole-updatelists)

    > When using remote lists like [this](https://v.firebog.net/hosts/lists.php?type=tick) or [this](https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt) it's a hassle to manually check for changes and update - this script will do that for you!



# _Predecessor AdList work for Pi-hole (v4.x)_
I also maintained a [v4.x AdList](https://gist.github.com/slmingol/f6b1d5ab852cdd1a2f4a499c3010db2d) for older versions of Pi-hole but at this point (1/2022) it's considered deprecated since I don't maintain any v4.x Pi-hole gear any longer. If you're looking for that list it's [here](https://gist.github.com/slmingol/f6b1d5ab852cdd1a2f4a499c3010db2d).


# References
- [For adlist sqlite3 schema docs](https://docs.pi-hole.net/database/gravity/?h=adlist#adlist-table-adlist)
- [Main pi-hole website](https://pi-hole.net/)
- [pi-hole github repo]()https://github.com/pi-hole/pi-hole)
- [Pretty CSV viewing on the Command Line](https://www.stefaanlippens.net/pretty-csv.html)
- [Markdown Guide - Basic Syntax](https://www.markdownguide.org/basic-syntax/)
- [DNS Blocklists - For a better internet!](https://github.com/hagezi/dns-blocklists)

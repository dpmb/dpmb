What we needed to do if a Debian Release happened or goes End of Life
=====================================================================

What we needed to do if a Debian Release happened
-------------------------------------------------

* `git grep <previous-release-name>` (e.g. `jessie` when `stretch` was
  released) and check if anything needs to be updated.

* Check all URLs refering to `testing`, e.g. by calling `git grep -E
  'https?://[^ ]*testing[^ ]*'`

* Check for URLs including release alias names ('oldstable', 'stable',
  etc.) and check if those URLs are still valid, i.e. if the packages
  made it into the according release. The following code snippet
  should do that: `git grep -E 'https?://[^ ]*stable[^ ]*' | egrep -o
  'https?://[^ ]*stable[^ ]*' | sort -u | while read URL ; do HEAD
  "$URL" | fgrep -q "200 OK" || echo $URL no more returns 200 OK.;
  done`

* Especially check which packages are no more part of the upcoming
  stable release:

  `for i in $(git grep -hEo 'https://packages.debian.org/de/stable/[-a-z0-9+]+' | sed -e s/stable/testing/) ; do echo -n $i" = "; GET -SUsed $i | fgrep Title; done | fgrep "Debian -- Error"`

What we needed to do if a Debian Release goes End of Life
---------------------------------------------------------

* `git grep <eol-release-name>` (e.g. `squeeze`) and check if anything
  needs to be updated or removed.

# stp-mirror
This is a small Studentportalen Uppsala University file area mirror utility. Tired of manually checking for and downloading updated files from studentportalen.uu.se? Use stp-mirror to sync (one-way) new and changed files from the course file areas.

Requirements
------------
* LWP
* Getopt::Long


Installation
------------
edit Makefile if needed (probably not)
```
make
make install (will install to /usr/local/bin if root, else ~/bin)
```

Configure stp-mirror by entering your login and password (key=value on one row each) in ~/.stp-mirror/account.conf. You may create this file by running stp-mirror.

Usage
-----
```
stp-mirror [-v] [-v] <url>
```
Where url is a course homepage on studentportalen.uu.se.

This will download all file areas of the course to the current directory.
File names will be based on titles with some mangling of unsafe characters.

If a local file already exist, only more recently updated wil be downloaded.
The utility will however *NOT* check for local changes, and will overwrite any local file with the same name if the remote file modification date is more recent.

Use at your own risk.

Limitations
-----------
Deleted or moved files on the server side will stay in the download folder using their old name.

Questions?
----------
Contact Per Eric Rosén (per@rosnix.net)
if you have questions, suggestions, or just find this script useful.

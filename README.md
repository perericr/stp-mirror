# stp-mirror
This is a small Studentportalen Uppsala University file area mirror utility. Tired of manually checking for and downloading files from studentportalen.uu.se? Use stp-mirror to sync (one-way) new and changed files from the course file areas.

Requirements
------------
LWP
Getopt::Long


Installation
------------
copy stp-mirror to suitable bin folder

Usage
-----
stp-mirror <url>
Where <url> is a course homepage on studentportalen.uu.se.

This will download all file areas of the course to the current directory.
File names will be based on titles with some mangling of unsafe characters.

If a local file already exist, only more recently updated wil be downloaded.
The utility will however *NOT* check for local changes, and will overwrite any local file with the same name if the remote file modification date is more recent.

Use at your own risk.

Questions?
----------
Contact Per Eric Rosén (per@rosnix.net)
if you have questions, suggestions, or just find this script useful.
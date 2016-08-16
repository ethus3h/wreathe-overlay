# wreathe-overlay
ebuilds for Wreathe

Currently experimental / in development.

To add to the system, run:

`layman -o https://raw.githubusercontent.com/ethus3h/wreathe-overlay/master/wreathe-overlay.xml -f -a wreathe-overlay -p 100`

To install, or update the main package, run:

`layman -s wreathe-overlay; emerge wreathe-base`

To update all components:

`layman -s wreathe-overlay; emerge wreathe-base wreathe-backgrounds wreathe-office-resources wreathe-typefaces-redist wreathe-typeface-family`

To develop it, in the git directory:

`repoman manifest; git add *; git commit -am "Overlay update"; git push -u origin master`


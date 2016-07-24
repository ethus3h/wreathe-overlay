# wreathe-overlay
ebuilds for Wreathe

To add to the system, run:

`layman -o https://raw.githubusercontent.com/ethus3h/wreathe-overlay/master/wreathe-overlay.xml -f -a wreathe-overlay`

To install or update in the system, run:

`layman -s wreathe-overlay; emerge wreathe-base wreathe-office-resources wreathe-backgrounds wreathe-typefaces-redist wreathe-typeface-family`

(wreathe-base does depend on the others, but specifying them all is the best way to ensure that they are all updated to keep them from getting out of sync, since that isn't apparently possible just using portage.)

To develop it, in the git directory:

`repoman manifest; git add *; git commit -am "Overlay update"; git push -u origin master`


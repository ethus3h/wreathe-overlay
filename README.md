# wreathe-overlay
ebuilds for Wreathe
To add to the system, run:

`layman -o https://raw.githubusercontent.com/ethus3h/wreathe-overlay/master/wreathe-overlay.xml -f -a wreathe-overlay`

To update in the system, run:

`layman -s wreathe-overlay; emerge wreathe-base`

To develop it, in the git directory:

`repoman manifest; git add -- .; git commit -m "Overlay update"; git push`


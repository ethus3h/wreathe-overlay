# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

DESCRIPTION="Crystallize"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/crystallize.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 -*"
RDEPEND="app-misc/wreathe-base
    dev-python/internetarchive"

pkg_preinst() {
    #Remove the temporary install prefix from scripts where it has been copied
    tempdir="${D}"
    export tempdir
    tempdirEsc="$(perl -0777 -e 'print(quotemeta($ENV{tempdir}))')"
    echo "Trying to replace $tempdirEsc\/\/usr\/local with \/usr\/"
    find "$tempdir" -type f -exec perl -0777 -p -i -e "s/$tempdirEsc\/\/usr\/local/\/usr\//g" {} \;
}

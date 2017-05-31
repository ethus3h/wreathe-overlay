# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Crystallize"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="https://github.com/ethus3h/crystallize/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3 BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND="app-misc/wreathe-base
	app-misc/ember-shared
	dev-python/internetarchive
	dev-python/fusepy
	sys-fs/zfs
	sys-apps/pv
	dev-vcs/git
	app-crypt/md5deep
	net-misc/curl
	net-misc/wget
	dev-python/awscli"

pkg_preinst() {
	#Remove the temporary install prefix from scripts where it has been copied
	tempdir="${D}"
	export tempdir
	tempdirEsc="$(perl -0777 -e 'print(quotemeta($ENV{tempdir}))')"
	find "$tempdir" -type f -exec perl -0777 -p -i -e "s/$tempdirEsc/\//g" {} \;
}

src_install() {
	if [[ -f Makefile || -f GNUmakefile || -f makefile ]] ; then
		emake DESTDIR="${D}" install
	fi

	if ! declare -p DOCS &>/dev/null ; then
		local d
		for d in README* ChangeLog AUTHORS NEWS TODO CHANGES \
				THANKS BUGS FAQ CREDITS CHANGELOG ; do
			[[ -s "${d}" ]] && dodoc "${d}"
		done
	elif [[ $(declare -p DOCS) == "declare -a "* ]] ; then
		dodoc "${DOCS[@]}"
	else
		dodoc ${DOCS}
	fi
	if [ ! -e /Ember\ Library ]; then
		dodir /Ember\ Library/Futuramerlin\ Projects/Data/Crystal\ Index/
	fi
}

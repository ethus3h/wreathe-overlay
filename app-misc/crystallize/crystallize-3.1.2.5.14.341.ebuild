# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ethus3h/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="A collection of tools for working with files and filesystems"
HOMEPAGE="https://futuramerlin.com/"

LICENSE="AGPL-3 BSD-2"
SLOT="0"
IUSE="doc"
RDEPEND="app-misc/wreathe-base
	app-misc/ember-shared
	app-misc/futuramerlin-web-toolkit
	>=app-arch/tar-1.30
	dev-python/internetarchive
	dev-python/fusepy
	sys-fs/zfs
	sys-apps/pv
	dev-vcs/git
	>=app-crypt/md5deep-4.4
	net-misc/curl
	net-misc/wget
	sys-fs/ncdu"
DEPEND="${RDEPEND}"

src_prepare() {
	cp "${FILESDIR}"/crystallize-update "${S}"/scripts/
	default
}

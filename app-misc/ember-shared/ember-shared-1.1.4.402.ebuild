# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Code shared between various Ember software"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
IUSE="doc"
KEYWORDS="~amd64 ~x86"
RDEPEND="dev-python/internetarchive
	dev-perl/HTML-Restrict
	app-misc/jq"
DEPEND="${RDEPEND}
	doc? ( app-misc/futuramerlin-web-toolkit )"

src_install() {
	default
	rm "${D}/usr/etc/ember.conf"
	rm "${D}/usr/share/ember"
	dosym /usr/etc/ember.conf /usr/etc/ember-shared.conf
	ln -s "${EPREFIX}"/usr/share/ember "${ED%/}"/usr/share/ember-shared/data
}
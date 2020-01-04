# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MODULE_AUTHOR=OALDERS
MODULE_VERSION="${PV}"
inherit perl-module

DESCRIPTION="HTML::LinkList - Strip unwanted HTML tags and attributes"

SRC_URI="https://cpan.metacpan.org/authors/id/${MODULE_AUTHOR:0:1}/${MODULE_AUTHOR:0:2}/${MODULE_AUTHOR}/${PN}-v${PV}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	dev-perl/Test-Fatal
	dev-perl/Sub-Quote
	dev-perl/HTML-Parser
	dev-perl/Data-Dump
	dev-perl/URI
	dev-perl/Moo
	dev-perl/Type-Tiny
	dev-perl/namespace-clean
"

S="${WORKDIR}/${PN}-v${PV}"

SRC_TEST=do

src_install() {
	perl-module_src_install
	rm -rf "${ED}"/usr/share/man || die
}

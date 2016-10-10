# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MODULE_AUTHOR=GAAS
MODULE_VERSION=3.72
inherit perl-module

DESCRIPTION="HTML::Parser - HTML parser class"

SRC_URI="https://cpan.metacpan.org/authors/id/G/GA/GAAS/${P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	dev-perl/Module-Build
	dev-perl/libwww-perl
	>=dev-lang/perl-5.8
	dev-perl/HTML-Tagset
	test? (
		dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage
	)
"

SRC_TEST=do

src_install() {
	perl-module_src_install
	rm -rf "${ED}"/usr/share/man || die
}

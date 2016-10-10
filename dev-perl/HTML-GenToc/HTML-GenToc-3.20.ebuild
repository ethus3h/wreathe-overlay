# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MODULE_AUTHOR=RUBYKAT
MODULE_VERSION=3.20
inherit perl-module

DESCRIPTION="hypertoc - generate a table of contents for HTML documents"

SRC_URI="https://cpan.metacpan.org/authors/id/R/RU/RUBYKAT/${P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	dev-perl/Module-Build
	dev-perl/HTML-SimpleParse
	virtual/perl-Getopt-Long
	dev-perl/Getopt-ArgvFile
	dev-perl/HTML-LinkList
	dev-perl/HTML-Parser
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

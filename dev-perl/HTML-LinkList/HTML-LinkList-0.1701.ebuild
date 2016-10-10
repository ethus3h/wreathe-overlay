# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MODULE_AUTHOR=RUBYKAT
MODULE_VERSION=0.1701
inherit perl-module

DESCRIPTION="HTML::LinkList - Create a 'smart' list of HTML links."

SRC_URI="https://cpan.metacpan.org/authors/id/R/RU/RUBYKAT/${P}.tar.gz"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	dev-perl/Module-Build
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

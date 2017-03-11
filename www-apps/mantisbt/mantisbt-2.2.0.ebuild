# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils webapp

DESCRIPTION="PHP/MySQL/Web based bugtracking system"
HOMEPAGE="http://www.mantisbt.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	virtual/httpd-php
	virtual/httpd-cgi
	>=dev-php/adodb-5.10"

src_prepare() {
	# Drop external libraries
	rm -r "${S}/library/adodb/"
}

src_install() {
	webapp_src_preinst
	dodoc readme.md doc/CREDITS doc/en-US/*

	rm -rf doc packages
	mv config/config_inc.php.sample config/config_inc.php
	cp -R . "${D}/${MY_HTDOCSDIR}"

	webapp_configfile "${MY_HTDOCSDIR}/config/config_inc.php"
	webapp_postinst_txt en "${FILESDIR}/postinstall-en-1.0.0.txt"
	webapp_src_install
}

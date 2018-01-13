# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

MY_P="${PF/-r/-test}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="threaded news reader"
HOMEPAGE="http://trn.sourceforge.net/"
SRC_URI="mirror://sourceforge/trn/trn4/${MY_P}.tar.gz
	http://trn.sourceforge.net/dist-3.0-70-wd2.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

src_prepare() {
	cd "${WORKDIR}/${MY_P}" || die
	cp "${FILESDIR}/config.sh" . || die
	./Configure -dse || die
}

src_install() {
	for i in Rnmail Pnews trn strn
	do
		doman "${S}/$i.1"
	done

	for i in Rnmail Pnews trn trn-artchk nntplist inews
	do
		dobin "${S}/$i"
	done

	dosym /usr/bin/trn /usr/bin/strn

	dodir "/usr/lib/${PN}"
	insinto "/usr/lib/${PN}"
	for i in norm.saver newsnews access.def makedir Speller INIT filexp mbox.saver Pnews.header
	do
		newins "${S}/$i" "$i"
	done

	dodir "/usr/lib/${PN}/HelpFiles"
	insinto "/usr/lib/${PN}/HelpFiles"
	for i in changelog hints quickstart top
	do
		newins "${S}/HelpFiles/$i" "$i"
	done

	dodir "/usr/lib/${PN}/HelpFiles/config"
	insinto "/usr/lib/${PN}/HelpFiles/config"
	for i in environment index macros options
	do
		newins "${S}/HelpFiles/config/$i" "$i"
	done

	dodir "/usr/lib/${PN}/HelpFiles/samples"
	insinto "/usr/lib/${PN}/HelpFiles/samples"
	for i in access index trnrc
	do
		newins "${S}/HelpFiles/samples/$i" "$i"
	done
}

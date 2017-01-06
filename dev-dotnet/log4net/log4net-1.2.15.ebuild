# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils mono-env dotnet-overlay multilib versionator gac

PV_MAJOR=$(get_version_component_range 1-2)

DESCRIPTION="tool to help the programmer output log statements to a variety of output targets"
HOMEPAGE="http://logging.apache.org/log4net/"
SRC_URI="mirror://apache/logging/log4net/source/${P}-src.zip
	http://dev.gentoo.org/~pacho/dotnet/log4net.snk"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/mono-4.0.2.5"
DEPEND="${RDEPEND}"

#FIXME: doesn't work (I think since Mono doesn't implement SubjectEncoding)
src_compile() {
	/usr/bin/mcs \
		-t:library \
		-out:log4net.dll \
		-keyfile:"${DISTDIR}"/log4net.snk \
		-r:System.Data \
		-r:System.Web \
		$(find src -name "*.cs") || die
}

src_install() {
	egacinstall log4net.dll
	einstall_pc_file "${PN}" "${PV}" "log4net"

	dodoc README.txt STATUS.txt
}

# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
SLOT="0"

KEYWORDS="~amd64 ~ppc ~x86"
USE_DOTNET="net45"

inherit gac dotnet-overlay git-r3

DESCRIPTION=".NET MIME creator/parser lib: S/MIME/PGP/DKIM/TNEF/Unix mbox"
HOMEPAGE="http://www.mimekit.net/"
EGIT_REPO_URI="git://github.com/jstedfast/MimeKit.git"
EGIT_COMMIT="1f5f5f844cab1c243fe95e746c776ee1ac57b01c"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-dotnet/nuget
	dev-dotnet/bouncycastle
	dev-lang/mono"

DEPEND="${RDEPEND}"

src_prepare() {
	default
}

src_compile() {
	exbuild_strong MailKit.Net40.sln
}

src_install() {
	if use debug; then
		DIR="Debug"
	else
		DIR="Release"
	fi
	egacinstall "bin/${DIR}/MailKit.dll"
	einstall_pc_file "${PN}" "${PV}" "MailKit"
}

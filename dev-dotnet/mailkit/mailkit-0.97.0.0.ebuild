# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
SLOT="0"

KEYWORDS="~amd64 ~ppc ~x86"
USE_DOTNET="net45"

inherit gac dotnet git-r3

DESCRIPTION="A cross-platform .NET library for IMAP, POP3, and SMTP."
HOMEPAGE="https://github.com/jstedfast/MailKit"
EGIT_REPO_URI="git://github.com/ethus3h/MailKit-meta.git"
EGIT_COMMIT="a6b3cec653228f2c42639e8bdba52f71cc06a810"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-dotnet/nuget
    dev-lang/mono"

DEPEND="${RDEPEND}"

S="${WORKDIR}/MailKit-meta/${P}"

src_prepare() {
    default
    mv ../MimeKit .
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

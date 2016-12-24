# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
SLOT="0"

KEYWORDS="~amd64 ~ppc ~x86"
USE_DOTNET="net45"

inherit gac dotnet git-r3

DESCRIPTION="A cross-platform .NET MIME creation and parser library with support for S/MIME, PGP, DKIM, TNEF and Unix mbox spools."
HOMEPAGE="http://www.mimekit.net/"
EGIT_REPO_URI="git://github.com/jstedfast/MimeKit.git"
EGIT_COMMIT="1f5f5f844cab1c243fe95e746c776ee1ac57b01c"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-dotnet/nuget
    dev-lang/mono"

DEPEND="${RDEPEND}"

src_prepare() {
    default
    perl -0777 -p -i -e 's#Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "UnitTests", "UnitTests\UnitTests.csproj", "{637EC535-3921-4A7A-8CB4-00A5AB18FAA2}"\nEndProject##g' MailKit.Net45.sln
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

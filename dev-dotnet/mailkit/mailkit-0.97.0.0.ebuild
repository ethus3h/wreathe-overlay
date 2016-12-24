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
EGIT_REPO_URI="git://github.com/jstedfast/MailKit.git"
EGIT_COMMIT="a6b3cec653228f2c42639e8bdba52f71cc06a810"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-dotnet/nuget
    dev-lang/mono"

DEPEND="${RDEPEND}"

src_prepare() {
    default
    (
        cd .nuget
        rm NuGet.exe
        ln -s "$(which nuget)" NuGet.exe
        ln -s NuGet.exe nuget.exe
        ln -s NuGet.targets nuget.targets
    )
    Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "UnitTests", "UnitTests\UnitTests.csproj", "{637EC535-3921-4A7A-8CB4-00A5AB18FAA2}"
    perl -0777 -p -i -e 's#Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "UnitTests", "UnitTests\UnitTests.csproj", "{637EC535-3921-4A7A-8CB4-00A5AB18FAA2}"\nEndProject##g' GoogleMaps.LocationServices/MailKit.Net45.sln
}

src_compile() {
    exbuild_strong MailKit.Net45.sln
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

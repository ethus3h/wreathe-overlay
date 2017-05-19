# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
SLOT="0"

KEYWORDS="~amd64 ~ppc ~x86"
USE_DOTNET="net45"

inherit gac dotnet

DESCRIPTION=".NET MIME creator/parser lib: S/MIME/PGP/DKIM/TNEF/Unix mbox"
HOMEPAGE="https://github.com/jstedfast/Portable.Text.Encoding"
SRC_URI="https://github.com/jstedfast/MimeKit/archive/1.2.7.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-dotnet/bouncycastle
	dev-dotnet/portable-text-encoding
	dev-lang/mono"

DEPEND="${RDEPEND}"

src_prepare() {
	default
	rm -r .nuget nuget submodules
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

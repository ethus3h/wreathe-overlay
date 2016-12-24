# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
SLOT="3"

KEYWORDS="~amd64 ~ppc ~x86"
USE_DOTNET="net45"

inherit gac dotnet git-r3

DESCRIPTION="the ninja of .net dependency injectors"
HOMEPAGE="http://ninject.org/"
LICENSE="MS-PL" # https://github.com/haf/DotNetZip.Semverd/blob/master/LICENSE
EGIT_REPO_URI="https://github.com/ninject/Ninject.git"
#Assuming the 3.0.0.15 version number means 15 commits after the 3.0.0 tag
EGIT_COMMIT="c0e9bc3d549b68a2c7fbee2cd8b959dcf35d12b5"

IUSE="net45 +gac +nupkg developer debug doc"

COMMON_DEPEND=">=dev-lang/mono-4.0.2.5
"
RDEPEND="${COMMON_DEPEND}
"
DEPEND="${COMMON_DEPEND}
"

src_compile() {
	exbuild_strong "Ninject.sln"
}

src_install() {
	if use debug; then
		DIR="Debug"
	else
		DIR="Release"
	fi
	egacinstall "bin/${DIR}/Ninject.dll"
	einstall_pc_file "${PN}" "${PV}" "Ninject"
}

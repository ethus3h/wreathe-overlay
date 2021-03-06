# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
SLOT="0"

KEYWORDS="~amd64 ~ppc ~x86"
USE_DOTNET="net45"

inherit dotnet

SRC_URI="https://github.com/haf/DotNetZip.Semverd/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/DotNetZip.Semverd-${PV}"

HOMEPAGE="https://github.com/haf/DotNetZip.Semverd"
DESCRIPTION="create, extract, or update zip files with C# (=DotNetZip+SemVer)"
LICENSE="Ms-PL" # https://github.com/haf/DotNetZip.Semverd/blob/master/LICENSE

IUSE="net45 +nupkg developer debug doc"

COMMON_DEPEND=">=dev-lang/mono-4.0.2.5
"
RDEPEND="${COMMON_DEPEND}
"
DEPEND="${COMMON_DEPEND}
"

src_compile() {
	#exbuild "/p:SignAssembly=true" "/p:AssemblyOriginatorKeyFile=${S}/src/Ionic.snk" "src/Zip Reduced/Zip Reduced.csproj"
	exbuild_strong "src/Zip Reduced/Zip Reduced.csproj"
}

src_install() {
	if use debug; then
		DIR="Debug"
	else
		DIR="Release"
	fi
	einstall_pc_file "${PN}" "${PV}" "Ionic.Zip.Reduced"
}

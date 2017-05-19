# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
SLOT="0"

KEYWORDS="~amd64 ~ppc ~x86"
USE_DOTNET="net45"

inherit gac dotnet

myCommit="74147c65fff30b872ea585fccf2c384b8d708353"
myPackageName="Portable.Text.Encoding"
DESCRIPTION="A Portable Implementation of System.Text.Encoding"
HOMEPAGE="https://github.com/jstedfast/Portable.Text.Encoding"
SRC_URI="https://github.com/jstedfast/${myPackageName}/archive/${myCommit}.zip -> ${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lang/mono"

DEPEND="${RDEPEND}"

S="${WORKDIR}/${myPackageName}-${myCommit}"

src_prepare() {
	default
	rm -r nuget
	sed -i -e 's#<Import Project="$(MSBuildExtensionsPath32)\\Microsoft\\Portable\\$(TargetFrameworkVersion)\\Microsoft.Portable.CSharp.targets" />##g' Portable.Text.Encoding/Portable.Text.Encoding.csproj || die
	sed -i -e 's#<Import Project="$(MSBuildExtensionsPath32)\\Microsoft\\Portable\\$(TargetFrameworkVersion)\\Microsoft.Portable.CSharp.targets" />
  <ItemGroup />##g' Portable.Text.Encoding/Portable.Text.Encoding.WindowsUniversal81.csproj || die
}

src_compile() {
	exbuild_strong Portable.Text.Encoding.sln
}

src_install() {
	if use debug; then
		DIR="Debug"
	else
		DIR="Release"
	fi
	egacinstall "bin/${DIR}/Portable.Text.Encoding.dll"
	einstall_pc_file "${PN}" "${PV}" "Portable.Text.Encoding"
}

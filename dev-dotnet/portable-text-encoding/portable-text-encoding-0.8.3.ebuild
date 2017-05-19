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

DEPEND="${RDEPEND}
	app-misc/ember-shared"

S="${WORKDIR}/${myPackageName}-${myCommit}"

src_prepare() {
	default
	rm -r nuget
	rm Portable.Text.Encoding/Portable.Text.Encoding.WindowsUniversal81.csproj
	# All this build file patching is needed because of http://futuramerlin.com/issue-tracker/view.php?id=620. Once that's fixed, ember-shared can be removed as a dependency of this.
	(
		pwd
		ls
		set -x
		trap 'die "A fatal error was reported on ${BASH_SOURCE[0]} line ${LINENO}."' ERR
		source ember_bash_setup || exit 1
		ereplace 'B76A64F9-B00E-4243-AE89-5D024CA3B436' "" Portable.Text.Encoding.sln
		cat Portable.Text.Encoding.sln
	) || die
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

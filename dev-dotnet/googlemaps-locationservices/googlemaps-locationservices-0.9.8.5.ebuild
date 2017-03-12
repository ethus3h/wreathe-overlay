# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
SLOT="0"

KEYWORDS="~amd64 ~ppc ~x86"
USE_DOTNET="net45"

inherit gac dotnet git-r3

DESCRIPTION="Library for Google Maps geolocation and reverse geolocation"
HOMEPAGE="https://github.com/sethwebster/GoogleMaps.LocationServices"
EGIT_REPO_URI="git://github.com/sethwebster/GoogleMaps.LocationServices.git"
EGIT_COMMIT="e01489c9b4083665e0764014d8fcd6eb270851ca"

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
	sed -i -e 's#<BuildPackage>true</BuildPackage>#<BuildPackage>false</BuildPackage>#g' GoogleMaps.LocationServices/GoogleMaps.LocationServices.csproj
}

src_compile() {
	exbuild_strong GoogleMaps.LocationServices.sln
}

src_install() {
	if use debug; then
		DIR="Debug"
	else
		DIR="Release"
	fi
	egacinstall "GoogleMaps.LocationServices/bin/${DIR}/GoogleMaps.LocationServices.dll"
	einstall_pc_file "${PN}" "${PV}" "GoogleMaps.LocationServices"
}

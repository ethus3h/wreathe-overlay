# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3
#java-pkg-2 java-pkg-simple

DESCRIPTION="BeHeMMOth bullet hell MMO game"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/BeHeMMOth.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
# Note that log4net-1.2.15 is the same as the version 2.0.5 of the NuGet package
# Note also that currently 1.2.15 won't build on Wreathe (I think because Mono doesn't implement SubjectEncoding), so it's not depending on that version (hopefully it'll work anyway?)
RDEPEND="
	>=virtual/jdk-1.8.0
	dev-db/phpmyadmin:=
	=dev-dotnet/dotnetzip-semverd-1.9.2
	=dev-dotnet/googlemaps-locationservices-0.9.8.5
	dev-dotnet/log4net
	dev-lang/mono
	dev-lang/perl
	dev-lang/php:=[cgi,cli]
	net-misc/rsync
	sys-apps/moreutils
	virtual/mysql
	www-plugins/lightspark
	www-servers/apache
	"
DEPEND="${RDEPEND}
	app-misc/ember-shared"
#	dev-misc/flex-sdk-4.9.1
#	dev-misc/air-sdk-15

# =dev-dotnet/mailkit-0.97.0.0
# =dev-dotnet/markermetro-unity-ionic-zlib-2.0.0.6
# =dev-dotnet/metroframework-1.3.0.0.1.3.0.0
# =dev-dotnet/mimekit-0.96.0.0
# =dev-dotnet/mysql-data-6.9.6
# =dev-dotnet/nettopologysuite-1.13.0
# =dev-dotnet/newtonsoft-json-9.0.1
# =dev-dotnet/zlib-net-1.0.4.0

# Needs llvm rebuild
# =dev-dotnet/geoapi-1.7.1

# VS2003 project file format?
# =dev-dotnet/bouncycastle-1.7.0

# Won't build: SubjectEncoding
# =dev-dotnet/log4net-1.2.15

src_install() {
	default
	# Remove the temporary install prefix from scripts where it has been copied
	(
		cd "${D}"
		export D
		find . -name "behemmoth_server" -or -name "behemmoth_client" -exec echo {} \;
		echo "Now operating on above files:"
		find . -name "behemmoth_server" -or -name "behemmoth_client" -exec bash -c 'source ember_bash_setup || exit 1; ereplace "${D}" "" "$0"' {} \; || die
	)
}

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3
#java-pkg-2 java-pkg-simple

DESCRIPTION="BeHeMMOth bullet hell MMO game"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/BeHeMMOth.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
#It doesn't seem to work with gnash, sadly.
#Instead, it should depend on www-plugins/lightspark, once I can get it to build.
#Also, it should depend on and use dev-java/launch4j:0, but I haven't gotten that to build either.
RDEPEND="dev-lang/mono
    dev-lang/perl
    www-servers/apache
    dev-lang/php[cgi]
    virtual/mysql
    dev-db/phpmyadmin
    net-misc/rsync
    sys-apps/moreutils
    >=virtual/jdk-1.8.0
    dev-java/commons-io:1
    dev-java/ini4j:0"
DEPEND="${RDEPEND}"

#JAVA_SRC_DIR="engine/Client Updater/Omod"
#JAVA_GENTOO_CLASSPATH="commons-io:1,ini4j"

pkg_preinst() {
    #Remove the temporary install prefix from scripts where it has been copied
    tempdir="${D}"
    export tempdir
    tempdirEsc="$(perl -0777 -e 'print(quotemeta($ENV{tempdir}))')"
    find "$tempdir" -name "behemmoth_server" -or -name "behemmoth_client" -exec perl -0777 -p -i -e "s/$tempdirEsc\/\/usr\/local//g" {} \;
}

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3 java-pkg-2 java-pkg-simple

DESCRIPTION="BeHeMMOth bullet hell MMO game"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/BeHeMMOth.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"
#It doesn't seem to work with gnash, sadly.
#Instead, it should depend on www-plugins/lightspark, once I can get it to build.
RDEPEND="dev-lang/mono
    dev-lang/perl
    www-servers/apache
    dev-lang/php
    virtual/mysql
    dev-db/phpmyadmin
    virtual/jdk
    dev-java/commons-io:1
    dev-java/ini4j:0
    dev-java/launch4j:0"
DEPEND="${RDEPEND}"

JAVA_SRC_DIR="engine/Client Updater/Omod"
JAVA_GENTOO_CLASSPATH="commons-io:1,ini4j:0,launch4j:0"

# Copyright 2015 Daniel 'herrnst' Scheller, Team Kodi
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Platform support library used by libCEC and binary add-ons for Kodi (meta-package)."
HOMEPAGE="https://github.com/Pulse-Eight/platform"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"
IUSE=""

DEPEND="|| ( dev-libs/libplatform dev-libs/libp8-platform )"
RDEPEND="${DEPEND}"

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Qt based front end for Oyranos. Application + Library"
HOMEPAGE="http://www.oyranos.org/synnefo/"
SRC_URI="https://github.com/oyranos-cms/Synnefo/archive/${PV}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="media-libs/oyranos"
DEPEND="${RDEPEND}"

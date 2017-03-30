# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils flag-o-matic gnome2-utils git-r3

EDITION="collect_edition"
DESCRIPTION="WC-NG client for Cube 2: Sauerbraten"
HOMEPAGE="https://github.com/tpoechtrager/wc-ng"
EGIT_REPO_URI="https://github.com/tpoechtrager/wc-ng.git"

LICENSE="ZLIB freedist"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug dedicated server"

RDEPEND="
	!games-fps/sauerbraten
	sys-libs/zlib
	>=net-libs/enet-1.3.6:1.3
	!dedicated? (
		media-libs/libsdl[X,opengl]
		media-libs/sdl-mixer[vorbis]
		media-libs/sdl-image[png,jpeg]
		virtual/opengl
		virtual/glu
		x11-libs/libX11 )"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}-${PV}

src_prepare() {
	ecvs_clean
	rm -rf sauerbraten_unix bin_unix src/{include,lib,vcpp}

	# Patch makefile to use system enet instead of bundled
	# respect CXXFLAGS, LDFLAGS
	epatch "${FILESDIR}"/${P}-{system-enet,QA}.patch

	# Fix links so they point to the correct directory
	sed -i -e 's:docs/::' README.html || die
}

src_compile() {
	use debug && append-cppflags -D_DEBUG
	emake -C src master $(usex dedicated "server" "$(usex server "server client" "client")")
}

src_install() {
	if ! use dedicated ; then
		# Install the game data
		insinto "${DATADIR}"
		doins -r data packages

		# Install the client executable
		exeinto "${LIBEXECDIR}"
		doexe src/sauer_client

		# Create menu entry
		newicon -s 256 data/cube.png ${PN}.png
		make_desktop_entry "${PN}-client" "Cube 2: Sauerbraten"
	fi

	# Install the server config files
	insinto "${STATEDIR}"
	doins "server-init.cfg"

	# Install the server executables
	exeinto "${LIBEXECDIR}"
	doexe src/sauer_master
	use dedicated || use server && doexe src/sauer_server

	# Install the server init script
	keepdir "${STATEDIR}/run/${PN}"
	newinitd "${T}"/${PN}.init ${PN}
	newconfd "${T}"/${PN}.conf ${PN}

	dodoc src/*.txt docs/dev/*.txt
	dohtml -r README.html docs/*
}

# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools git-r3

DESCRIPTION="FUSE-based single file backing store via Amazon S3"
HOMEPAGE="https://github.com/archiecobbs/s3backer"
EGIT_REPO_URI="https://github.com/archiecobbs/s3backer.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="net-misc/curl
	sys-fs/fuse
	sys-libs/zlib
	dev-libs/expat
	dev-libs/openssl"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e "/docdir=/s:packages/\$(PACKAGE):${PF}:" \
		-e "/doc_DATA=/d" \
		-i Makefile.am || die

	eautoreconf
}

src_compile() {
	emake CFLAGS="${CFLAGS}"
}

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A fork of the DotNetZip project without signing with a solution that compiles cleanly. This project aims to follow semver to avoid versioning conflicts. DotNetZip is a FAST, FREE class library and toolset for manipulating zip files. Use VB, C# or any .NET language to easily create, extract, or update zip files."
HOMEPAGE="https://github.com/haf/DotNetZip.Semverd"
SRC_URI="https://github.com/haf/DotNetZip.Semverd/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lang/mono
    >=dev-ruby/albacore-2.0.0
    <dev-ruby/albacore-2.1"

DEPEND="${RDEPEND}"

src_prepare() {
    sed -i -e '/bundler/I s:^:#:' Rakefile || die
}

src_compile() {
    rake
}

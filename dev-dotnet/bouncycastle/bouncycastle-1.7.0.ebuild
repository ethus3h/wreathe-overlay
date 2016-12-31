# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Bouncy Castle C# API"
HOMEPAGE="http://www.bouncycastle.org/csharp/"
SRC_URI="http://www.bouncycastle.org/csharp/download/bccrypto-net-1.7-src-ext.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lang/mono"
DEPEND="${RDEPEND}"

src_compile() {
	#FIXME: warning : /home/kyan/Downloads/csharp/crypto/crypto.csproj: Project file '/home/kyan/Downloads/csharp/crypto/crypto.csproj' is a VS2003 project, which is not supported by xbuild. You need to convert it to msbuild format to build with xbuild.
	xbuild csharp/csharp.sln
}

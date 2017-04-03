# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit java-pkg-2 java-ant-2 subversion

DESCRIPTION="Platform Independent Tool to Download Files from One-Click-Hosting Sites"
HOMEPAGE="http://jdownloader.org"

# Workaround for single-valued ESVN_REPO_URI
# (s. src_unpack())
ESVN_REPO_URI_AW_UPDCLIENT="svn://svn.jdownloader.org/updclient"
ESVN_REPO_URI_AW_UTILS="svn://svn.appwork.org/utils"
ESVN_REPO_URI_JD_BROWSER="svn://svn.jdownloader.org/jdownloader/browser"
ESVN_REPO_URI_JD="svn://svn.jdownloader.org/jdownloader/trunk"
ESVN_REPO_URI_JDJSAPI="svn://svn.jdownloader.org/jdownloader/jdjsapi"
ESVN_REPO_URI_MYJD_CLIENT="svn://svn.jdownloader.org/jdownloader/MyJDownloaderClient"

ESVN_REPO_URI="${ESVN_REPO_URI_JD}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

src_unpack() {
	# subversion_fetch "${ESVN_REPO_URI_AW_UPDCLIENT}" appwork-updclient
	subversion_fetch "${ESVN_REPO_URI_AW_UTILS}" appwork-utils
	subversion_fetch "${ESVN_REPO_URI_JD_BROWSER}" jd-browser
	subversion_fetch "${ESVN_REPO_URI_JDJSAPI}" jdjsapi
	subversion_fetch "${ESVN_REPO_URI_MYJD_CLIENT}" MyJDownloaderClient
	subversion_fetch "${ESVN_REPO_URI}" jdownloader
	cd "${S}"
	# Remove precompiled files to force using system libraries
	(
		cd appwork-utils
		rm -rfv \
			libs/* \
			ant/*.jar \
			dev_libs/* \
			dist/* \
			bin/*
	)
	(
		cd jdownloader
		rm -rfv \
			ressourcen/tools/* \
			ressourcen/libs/* \
			ressourcen/code-ressourcen/* \
			ressourcen/nsis/* \
			ressourcen/browserintegration/chrome/*.crx \
			ressourcen/security/* \
			ressourcen/libs_ext/* \
			dev/* \
			tools/rtmpdump/* \
			tools/*.jar \
			tools/*.exe \
			tools/Elevate/bin/* \
			build/*.jar \
			bin/*
	)
	rm -rfv jd-browser/bin/* jd-browser/libs/* MyJDownloaderClient/libs/* jdjsapi/deprecated/build/tools/*.jar jdjsapi/deprecated/example/captchapush/publish-mobile/* jdjsapi/deprecated/example/captchapush/build/tools/*.jar jdjsapi/deprecated/example/captchapush/build/tools/*exe
	mv appwork-utils jdownloader/build/AppWorkUtils
	mv MyJDownloaderClient jdownloader/build/MyJDownloaderClient
	find . -type d -empty -exec touch {}/.keep \;
	# This ebuild just downloads and arranges the source files from SVN for packaging.
}

src_compile() {
	exit 1
}

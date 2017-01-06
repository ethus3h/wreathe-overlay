# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3

DESCRIPTION="Third-party overlays used by Wreathe"
HOMEPAGE="https://futuramerlin.com/"
EGIT_REPO_URI="git://github.com/ethus3h/wreathe-overlays-redist.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
DEPEND="dev-vcs/git"

src_prepare() {
	eapply_user
	for dir in *; do
		if [ -d "${dir}" ]; then
			(
				cd "${dir}" || exit 1
				here="${PWD##*/}"
				line="$(grep -A 1 -P -e "path = $here" ../.gitmodules | tail -1)"
				url="${line:7}"
				git checkout master
				git reset --hard
				echo "Adding origin URL: $url"
				git remote add origin "$url"
				git fetch
				git branch --set-upstream-to=origin/master master
				git pull
			)
		fi
	done
}

src_install() {
	insinto /var/lib/layman/
	GLOBIGNORE="README.md:.git:.gitmodules:.egup.tags"
	doins -r *
	unset GLOBIGNORE
}

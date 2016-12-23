# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Albacore is a professional quality suite of Rake tasks for building .NET or Mono based systems."
HOMEPAGE="http://www.albacorebuild.net/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_bdepend ">=dev-ruby/nokogiri-1.5
    <dev-ruby/nokogiri-2"

all_ruby_prepare() {
    sed -i -e '/bundler/I s:^:#:' Rakefile || die
}

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_GEMSPEC="Gem.gemspec"

inherit ruby-fakegem

DESCRIPTION="Forwardable with hash, and instance variable extensions"
HOMEPAGE="https://rubygems.org/gems/forwardable-extended https://github.com/envygeeks/forwardable-extended"
SRC_URI="https://github.com/envygeeks/forwardable-extended/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

all_ruby_prepare() {
	sed -i -e '/\(coverage\|luna\|rspec\/helpers\)/ s:^:#:' spec/rspec/helper.rb || die
	rm -f spec/support/coverage.rb || die
}

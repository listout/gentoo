# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Create a diff disregarding formatting"
HOMEPAGE="https://www.gnu.org/software/wdiff/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos"
IUSE="experimental test"
RESTRICT="!test? ( test )"

RDEPEND="
	sys-apps/diffutils
	sys-apps/less
	sys-libs/ncurses:=
"
DEPEND="${RDEPEND}"
BDEPEND="
	sys-apps/texinfo
	test? ( app-misc/screen )
"

src_configure() {
	econf $(use_enable experimental)
}

src_test() {
	# The test suite hangs in the '3: use pager' test
	# when an incompatible screenrc is found
	touch tests/screenrc || die
	export SYSSCREENRC=tests/screenrc SCREENRC=tests/screenrc

	default
}

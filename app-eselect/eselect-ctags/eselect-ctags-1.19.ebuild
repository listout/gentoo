# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P="eselect-emacs-${PV}"
DESCRIPTION="Manages ctags implementations"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Emacs"
SRC_URI="https://dev.gentoo.org/~ulm/emacs/${MY_P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"

RDEPEND=">=app-admin/eselect-1.2.3"

S="${WORKDIR}/${MY_P}"

src_install() {
	insinto /usr/share/eselect/modules
	doins {ctags,etags}.eselect
	doman {ctags,etags}.eselect.5
}

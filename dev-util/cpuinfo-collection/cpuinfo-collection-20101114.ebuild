# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P=test_proc-${PV:6:2}November${PV:0:4}
DESCRIPTION="huge collection of /proc/cpuinfo files"
HOMEPAGE="http://www.deater.net/weave/vmwprod/linux_logo/"
SRC_URI="http://www.deater.net/weave/vmwprod/linux_logo/${MY_P}.tar.gz"
S="${WORKDIR}"/${MY_P}

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86"

src_install() {
	insinto /usr/share/cpuinfo
	doins -r .
}

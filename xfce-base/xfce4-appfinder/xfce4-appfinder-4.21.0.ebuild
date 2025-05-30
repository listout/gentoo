# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson xdg-utils

DESCRIPTION="A tool to find and launch installed applications for the Xfce desktop"
HOMEPAGE="
	https://docs.xfce.org/xfce/xfce4-appfinder/start
	https://gitlab.xfce.org/xfce/xfce4-appfinder/
"
SRC_URI="https://archive.xfce.org/src/xfce/${PN}/${PV%.*}/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~loong ~mips ~ppc ~ppc64 ~riscv ~sparc ~x86 ~amd64-linux ~x86-linux"

DEPEND="
	>=dev-libs/glib-2.72.0
	>=x11-libs/gtk+-3.24.0:3
	>=xfce-base/garcon-4.18.0:=
	>=xfce-base/libxfce4util-4.18.0:=
	>=xfce-base/libxfce4ui-4.21.0:=[gtk3(+)]
	>=xfce-base/xfconf-4.18.0:=
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	sys-devel/gettext
	virtual/pkgconfig
"

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}

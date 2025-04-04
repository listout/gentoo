# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

MY_P="${P}.20250127"

DESCRIPTION="Command line tools and C library for accessing Mega cloud storage"
HOMEPAGE="https://xff.cz/megatools/"
SRC_URI="https://xff.cz/megatools/builds/builds/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="
	dev-libs/glib:2
	dev-libs/openssl:0=
	net-libs/glib-networking[ssl]
	net-misc/curl
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-text/asciidoc
	virtual/pkgconfig
"

src_install() {
	meson_src_install

	rm -r "${ED}/usr/share/doc/${PN}" || die
}

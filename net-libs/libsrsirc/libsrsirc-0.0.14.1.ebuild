# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Lightweight, cross-platform IRC library"
HOMEPAGE="https://github.com/fstd/libsrsirc"
SRC_URI="https://kiwi.pr0.tips/${P}.tar.gz"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs ssl"

DEPEND="ssl? ( dev-libs/openssl:0= )"
RDEPEND="${DEPEND}"

src_configure() {
	econf $(use_enable static-libs static) $(use_with ssl)
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
	mv "${ED}/usr/bin/icat" "${ED}/usr/bin/icat-lsi" || die
}

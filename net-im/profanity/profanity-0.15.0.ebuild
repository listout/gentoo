# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit python-single-r1

DESCRIPTION="A console based XMPP client inspired by Irssi"
HOMEPAGE="https://profanity-im.github.io"
SRC_URI="
	https://github.com/profanity-im/profanity/releases/download/${PV}/${P}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="libnotify omemo omemo-qrcode otr gpg test xscreensaver python"
RESTRICT="!test? ( test )"
REQUIRED_USE="omemo-qrcode? ( omemo ) python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	>=app-accessibility/at-spi2-core-2.46.0
	dev-db/sqlite:3
	dev-libs/glib:2
	>=dev-libs/libstrophe-0.12.3:=
	media-libs/harfbuzz:=
	net-misc/curl
	sys-libs/ncurses:=[unicode(+)]
	sys-libs/readline:=
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/pango
	x11-misc/shared-mime-info
	gpg? ( app-crypt/gpgme:= )
	libnotify? ( x11-libs/libnotify )
	omemo? (
		dev-libs/libgcrypt:=
		net-libs/libsignal-protocol-c
	)
	omemo-qrcode? ( media-gfx/qrencode:= )
	otr? ( net-libs/libotr )
	python? ( ${PYTHON_DEPS} )
	xscreensaver? (
		x11-libs/libXScrnSaver
		x11-libs/libX11
	)
"
DEPEND="
	${RDEPEND}
	test? ( dev-util/cmocka )
	python? (
		$(python_gen_cond_dep '
			dev-python/cython[${PYTHON_USEDEP}]
		')
	)
"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local myeconfargs=(
		--enable-gdk-pixbuf
		$(use_enable libnotify notifications)
		$(use_enable omemo)
		$(use_enable omemo-qrcode)
		$(use_enable otr)
		$(use_enable python python-plugins)
		$(use_enable gpg pgp)
		$(use_with xscreensaver)
	)

	econf "${myeconfargs[@]}"
}

src_compile() {
	emake CFLAGS="${CFLAGS}"
}

src_install() {
	default

	find "${ED}" -type f -name '*.la' -delete || die
}

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..13} )

inherit gnome.org meson python-any-r1 vala xdg

DESCRIPTION="A framework for easy media discovery and browsing"
HOMEPAGE="https://gitlab.gnome.org/GNOME/grilo"

LICENSE="LGPL-2.1+"
SLOT="0.3/0" # subslot is libgrilo-0.3 soname suffix
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~loong ~ppc ~ppc64 ~riscv ~sparc ~x86"

IUSE="gtk gtk-doc +introspection +playlist test vala"
REQUIRED_USE="vala? ( introspection )"
RESTRICT="!test? ( test )"

# oauth could be optional if meson is patched - used for flickr oauth in grilo-test-ui tool
RDEPEND="
	>=dev-libs/glib-2.66:2
	>=net-libs/libsoup-3:3.0[introspection?]
	playlist? ( >=dev-libs/totem-pl-parser-3.4.1:= )
	introspection? ( >=dev-libs/gobject-introspection-1.54:= )

	gtk? (
		net-libs/liboauth
		>=x11-libs/gtk+-3.14:3
	)
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-util/glib-utils
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig
	gtk-doc? (
		>=dev-util/gtk-doc-1.10
		app-text/docbook-xml-dtd:4.3
	)
	${PYTHON_DEPS}
	test? ( sys-apps/dbus )
	vala? ( $(vala_depend) )
"

src_prepare() {
	sed -i -e "s:'GETTEXT_PACKAGE', meson.project_name():'GETTEXT_PACKAGE', 'grilo-${SLOT%/*}':" meson.build || die
	sed -i -e "s:meson.project_name():'grilo-${SLOT%/*}':" po/meson.build || die
	sed -i -e "s:'grilo':'grilo-${SLOT%/*}':" doc/grilo/meson.build || die

	# Drop explicit unversioned vapigen check
	sed -i -e "/find_program.*vapigen/d" meson.build || die

	# Don't build examples; they get embedded in gtk-doc, thus we don't install the sources with USE=examples either
	sed -i -e "/subdir('examples')/d" meson.build || die

	default
	xdg_environment_reset
	use vala && vala_setup
}

src_configure() {
	local emesonargs=(
		-Denable-grl-net=true # Fails to build
		$(meson_use playlist enable-grl-pls)
		$(meson_use gtk-doc enable-gtk-doc)
		$(meson_use introspection enable-introspection)
		$(meson_use gtk enable-test-ui)
		$(meson_use vala enable-vala)
		-Dsoup3=true
	)
	meson_src_configure
}

src_test() {
	dbus-run-session meson test -C "${BUILD_DIR}" || die
}

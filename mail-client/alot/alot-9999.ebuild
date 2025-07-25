# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="Experimental terminal UI for net-mail/notmuch written in Python"
HOMEPAGE="https://github.com/pazz/alot"
if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="https://github.com/pazz/alot/"
	inherit git-r3
else
	SRC_URI="https://github.com/pazz/alot/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="doc"

RDEPEND="
	dev-python/gpgmepy[${PYTHON_USEDEP}]
	>=dev-python/configobj-4.7.0[${PYTHON_USEDEP}]
	dev-python/python-magic[${PYTHON_USEDEP}]
	>=dev-python/urwid-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/urwidtrees-1.0.3[${PYTHON_USEDEP}]
	>=dev-python/twisted-18.4.0[${PYTHON_USEDEP}]
	net-mail/mailbase
	>=net-mail/notmuch-0.30[crypt,python,${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
"

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}

distutils_enable_tests unittest

python_compile_all() {
	# sphinx uses importlib to get the package version
	local -x PYTHONPATH="${BUILD_DIR}/install$(python_get_sitedir):${PYTHONPATH}"
	emake -C docs man
	use doc && emake -C docs html
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/build/html/. )
	doman docs/build/man/*
	distutils-r1_python_install_all

	insinto /usr/share/alot
	doins -r extra
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]] ; then
		elog ""
		elog "If you are new to Alot you may want to take a look at"
		elog "the user manual:"
		elog "   https://alot.readthedocs.io/en/latest/"
		elog ""
	fi
}

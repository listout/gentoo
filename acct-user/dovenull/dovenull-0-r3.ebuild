# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="user for dovecot daemon"
ACCT_USER_ID=74
ACCT_USER_GROUPS=( dovenull )

acct-user_add_deps

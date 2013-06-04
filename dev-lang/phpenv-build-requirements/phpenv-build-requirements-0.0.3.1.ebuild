# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Meta package to pull in build requirements for phpenv"
HOMEPAGE=""
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+vanilla"

DEPEND=""
RDEPEND="
	dev-util/re2c
	vanilla? ( <=sys-devel/bison-2.6.2 )
"


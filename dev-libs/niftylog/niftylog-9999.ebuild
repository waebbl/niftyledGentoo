# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git-2 autotools

DESCRIPTION="lightweight library to implement logging/debugging output for new or existing applications."
HOMEPAGE="http://wiki.niftylight.de/libniftylog"
EGIT_REPO_URI="git://github.com/niftylight/niftylog.git https://github.com/niftylight/niftylog.git"
#EGIT_COMMIT="master"
#EGIT_BRANCH="${EGIT_COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="debug"

RDEPEND=""
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare()
{
	eautoreconf
}

src_unpack()
{
	git-2_src_unpack
}

src_configure()
{
	econf \
	    $(use_enable debug)
}

src_install() {
	emake DESTDIR="${D}" install || die

	dodoc NEWS README AUTHORS ChangeLog
}

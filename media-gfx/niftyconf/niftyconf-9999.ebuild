# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 autotools

DESCRIPTION="niftyled setup configuration GUI"
HOMEPAGE="http://wiki.niftylight.de/niftyconf"
EGIT_REPO_URI="git://github.com/niftylight/niftyconf.git https://github.com/niftylight/niftyconf.git"
#EGIT_COMMIT="master"
#EGIT_BRANCH="${EGIT_COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="debug"

RDEPEND="media-gfx/niftyled
	 x11-libs/gtk+
	 x11-libs/cairo
	 dev-libs/glib"

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

    dodoc NEWS README COPYING AUTHORS ChangeLog
}
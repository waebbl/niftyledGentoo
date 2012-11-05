# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 autotools

DESCRIPTION="niftyled screen capture tool"
HOMEPAGE="http://wiki.niftylight.de/ledcap"
EGIT_REPO_URI="git://github.com/niftylight/ledcap.git https://github.com/niftylight/ledcap.git"
#EGIT_COMMIT="master"
#EGIT_BRANCH="${EGIT_COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="debug imlib X"

RDEPEND="media-gfx/niftyled
	imlib? ( media-libs/imlib2 )
	X? ( x11-libs/libX11 )"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

REQUIRED_USE="|| ( X imlib )"




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
                $(use_enable debug) \
                $(use_enable imlib imlib-capture) \
                $(use_enable X x-capture)

}

src_install() {
    emake DESTDIR="${D}" install || die

    dodoc NEWS README COPYING AUTHORS ChangeLog
}
# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git-2 autotools

DESCRIPTION="library designed to provide an abstract interface for LED/lighting hardware"
HOMEPAGE="http://wiki.niftylight.de/libniftyled"
EGIT_REPO_URI="git://github.com/niftylight/niftyled.git https://github.com/niftylight/niftyled.git"
#EGIT_COMMIT="master"
#EGIT_BRANCH="${EGIT_COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="debug gstreamer vlc"

PDEPEND="gstreamer? ( media-plugins/gst-plugins-niftyled )
	vlc? ( media-plugins/niftyled-vlc )"

RDEPEND="dev-libs/niftylog
	dev-libs/niftyprefs
	media-libs/babl"

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

src_install()
{
	emake DESTDIR="${D}" install || die

	dodoc NEWS README AUTHORS ChangeLog
}

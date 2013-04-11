# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git-2 autotools

DESCRIPTION="niftyled cat tool"
HOMEPAGE="http://wiki.niftylight.de/ledcat"
EGIT_REPO_URI="git://github.com/niftylight/ledcat.git https://github.com/niftylight/ledcat.git"
#EGIT_COMMIT="master"
#EGIT_BRANCH="${EGIT_COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="debug imagemagick"

RDEPEND="media-gfx/niftyled
	imagemagick? ( media-gfx/imagemagick )"

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
	    $(use_enable debug) \
	    $(use_enable imagemagick)
}

src_install()
{
	emake DESTDIR="${D}" install || die

	dodoc NEWS README AUTHORS ChangeLog
}

pkg_postinst()
{
        echo
        elog "Sample configs come with libniftyled. Find them in"
        elog "/usr/share/niftyled/examples/"
        elog "Copy config to ~/.ledcat.xml or use the -c argument"
        elog "to select a config. For further information,"
        elog "see documentation at http://wiki.niftylight.de/${PN}"
        echo
}

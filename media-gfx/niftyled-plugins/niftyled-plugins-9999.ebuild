# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 autotools

DESCRIPTION="libniftyled runtime loadabled plugins"
HOMEPAGE="http://wiki.niftylight.de/Hardware-plugins"
EGIT_REPO_URI="git://github.com/niftylight/niftyled-plugins.git https://github.com/niftylight/niftyled-plugins.git"
#EGIT_COMMIT="master"
#EGIT_BRANCH="${EGIT_COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="debug niftylino arduino usb"

RDEPEND="media-gfx/niftyled"

DEPEND="${RDEPEND} 
	virtual/pkgconfig"

REQUIRED_USE="
	niftylino? ( usb )"



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
                $(use_enable niftylino niftylino-plugin) \
                $(use_enable arduino arduino_72xx-plugin)
}

src_install() {
    emake DESTDIR="${D}" install || die

    dodoc NEWS README COPYING AUTHORS ChangeLog
}
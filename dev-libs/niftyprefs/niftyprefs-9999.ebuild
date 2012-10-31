# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit git-2 autotools

DESCRIPTION="lightweight library to handle preferences for arbitrary (tree) objects using XML"
HOMEPAGE="http://wiki.niftylight.de/libniftyprefs"
EGIT_REPO_URI="git://github.com/niftylight/niftyprefs.git https://github.com/niftylight/niftyprefs.git"
#EGIT_COMMIT="master"
#EGIT_BRANCH="${EGIT_COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="debug"

RDEPEND="sys-libs/glibc
		dev-libs/libxml2
		dev-libs/niftylog"
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
	# debugging symbols?
	if use debug ; then
		myconf+=" --enable-debug"
	else
		myconf+=" --disable-debug"
	fi

    econf ${myconf}
}

src_install() {
    emake DESTDIR="${D}" install

    dodoc NEWS README COPYING AUTHORS ChangeLog
}

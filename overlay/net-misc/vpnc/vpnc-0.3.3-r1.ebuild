# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/vpnc/vpnc-0.3.3-r1.ebuild,v 1.4 2006/02/11 08:02:34 corsair Exp $

inherit eutils

DESCRIPTION="Free client for Cisco VPN routing software"
HOMEPAGE="http://www.unix-ag.uni-kl.de/~massar/vpnc/"
SRC_URI="http://www.unix-ag.uni-kl.de/~massar/vpnc/${P}.tar.gz"

LICENSE="GPL-2 BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ppc64 ~sparc ~x86"
IUSE=""

DEPEND=">=dev-libs/libgcrypt-1.1.91
	sys-apps/iproute2"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/${P}-sbin-path.patch
	epatch ${FILESDIR}/vpnc-0.3.2-pie.patch
	epatch ${FILESDIR}/${P}-ip-output.patch
	epatch ${FILESDIR}/${P}-no-srcport.patch
	epatch ${FILESDIR}/${P}-rekeying.patch
	# Workaround for crappy Makefile
	sed -i -e "s:CFLAGS=-W -Wall -O:CFLAGS=${CFLAGS}:" Makefile
}

src_install() {
	dobin vpnc vpnc-disconnect pcf2vpnc
	dodoc ChangeLog README TODO VERSION
	doman vpnc.8
	insinto /etc
	doins vpnc.conf
	exeinto /etc/vpnc
	doexe vpnc-script
	dodir /var/run/vpnc
}

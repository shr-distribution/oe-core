SUMMARY = "Automated text and program generation tool"
DESCRIPTION = "AutoGen is a tool designed to simplify the creation and\
 maintenance of programs that contain large amounts of repetitious text.\
 It is especially valuable in programs that have several blocks of text\
 that must be kept synchronized."
HOMEPAGE = "http://www.gnu.org/software/autogen/"
SECTION = "devel"
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"

SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
           file://increase-timeout-limit.patch \
           file://mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch \
           file://redirect-output-dir.patch \
"

SRC_URI[md5sum] = "385d7c7dfbe60babbee261c054923a53"
SRC_URI[sha256sum] = "7bbdb73b5518baf64c6d3739fb2ecc66d2cccda888ce5ad573abe235ab5d96ba"

UPSTREAM_CHECK_URI = "http://ftp.gnu.org/gnu/autogen/"
UPSTREAM_CHECK_REGEX = "rel(?P<pver>\d+(\.\d+)+)/"

DEPENDS = "guile-native libtool-native libxml2-native"

inherit autotools texinfo native pkgconfig

# autogen-native links against libguile which may have been relocated with sstate
# these environment variables ensure there isn't a relocation issue
export GUILE_LOAD_PATH = "${STAGING_DATADIR_NATIVE}/guile/2.0"
export GUILE_LOAD_COMPILED_PATH = "${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache"

do_install_append () {
	create_wrapper ${D}/${bindir}/autogen \
		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
}

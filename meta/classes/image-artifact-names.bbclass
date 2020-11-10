##################################################################
# Specific image creation and rootfs population info.
##################################################################

IMAGE_BASENAME ?= "${PN}"
IMAGE_VERSION_SUFFIX ?= "${PKGE}-${PKGV}-${PKGR}-${DATETIME}"
IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
IMAGE_LINK_NAME ?= "${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}"

# IMAGE_NAME is the base name for everything produced when building images.
# The actual image that contains the rootfs has an additional suffix (.rootfs
# by default) followed by additional suffices which describe the format (.ext4,
# .ext4.xz, etc.).
IMAGE_NAME_SUFFIX ??= ".rootfs"

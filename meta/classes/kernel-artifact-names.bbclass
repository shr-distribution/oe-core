##################################################################
# Specific kernel creation info
# for recipes/bbclasses which need to reuse some of the kernel
# artifacts, but aren't kernel recipes themselves
##################################################################

inherit image-artifact-names

# Intentionally use PR instead of PKGR, because EXTENDPRAUTO included
# in PKGR will have different value for do_install/do_deploy/do_deploy_links
# tasks with different TASKHASH, causing multiple EXTENDPRAUTO increments for
# each kernel build and more importantly preventing do_deploy_links to
# reference artifacts created do_deploy task
KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PR}-${MACHINE}"
KERNEL_ARTIFACT_LINK_NAME ?= "${KERNEL_ARTIFACT_NAME}${IMAGE_VERSION_SUFFIX}"

KERNEL_IMAGE_NAME ?= "${KERNEL_ARTIFACT_NAME}"
KERNEL_IMAGE_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"

KERNEL_DTB_NAME ?= "${KERNEL_ARTIFACT_NAME}"
KERNEL_DTB_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"

KERNEL_FIT_NAME ?= "${KERNEL_ARTIFACT_NAME}"
KERNEL_FIT_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"

MODULE_TARBALL_NAME ?= "${KERNEL_ARTIFACT_NAME}"
MODULE_TARBALL_LINK_NAME ?= "${KERNEL_ARTIFACT_LINK_NAME}"
MODULE_TARBALL_DEPLOY ?= "1"

INITRAMFS_NAME ?= "initramfs-${KERNEL_ARTIFACT_NAME}"
INITRAMFS_LINK_NAME ?= "initramfs-${KERNEL_ARTIFACT_LINK_NAME}"

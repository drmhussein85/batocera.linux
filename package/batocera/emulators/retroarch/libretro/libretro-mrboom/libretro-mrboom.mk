################################################################################
#
# MRBOOM
#
################################################################################
# Version.: Commits on May 2, 2020
LIBRETRO_MRBOOM_VERSION = 441ba41151f2a688c6d9a2c1a34ff2106d8c57f8
LIBRETRO_MRBOOM_SITE = https://github.com/libretro/mrboom-libretro.git
LIBRETRO_MRBOOM_SITE_METHOD=git
LIBRETRO_MRBOOM_GIT_SUBMODULES=YES
LIBRETRO_MRBOOM_LICENSE="GPLv2"

ifeq ($(BR2_ARM_FPU_NEON_VFPV4)$(BR2_ARM_FPU_NEON)$(BR2_ARM_FPU_NEON_FP_ARMV8),y)
    LIBRETRO_MRBOOM_EXTRA_ARGS = HAVE_NEON=1
endif

define LIBRETRO_MRBOOM_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform=unix $(LIBRETRO_MRBOOM_EXTRA_ARGS)
endef

define LIBRETRO_MRBOOM_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mrboom_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mrboom_libretro.so
endef

$(eval $(generic-package))

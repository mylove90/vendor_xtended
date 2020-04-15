# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Xtended System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.xtended.build.date=$(XTENDED_BUILD_DATE) \
    ro.xtended.display.version=$(XTENDED_MOD_VERSION) \
    com.xtended.fingerprint=$(XTENDED_FINGERPRINT) \
    ro.xtended.releasetype=$(XTENDED_BUILD_TYPE) \
    ro.xtended.version=$(XTENDED_VERSION) \
    ro.xtended.maintainer=$(XTENDED_MAINTAINER)

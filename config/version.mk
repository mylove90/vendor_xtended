# Versioning System
# Xtended first version.
XTENDED_MAJOR_VERSION = XQ
XTENDED_RELEASE_VERSION = v8.0

XTENDED_BUILD_DATE := $(shell date +"%Y%m%d")

ifndef XTENDED_BUILD_TYPE
    XTENDED_BUILD_TYPE := XPLOITED
endif

ifeq ($(XTENDED_TEST),true)
    XTENDED_BUILD_TYPE := BETA
endif

ifeq ($(XTENDED_OFFICIAL), true)
   LIST = $(shell cat vendor/xtended/xtended.devices)
    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      IS_OFFICIAL=true
      XTENDED_BUILD_TYPE := OFFICIAL

PRODUCT_PACKAGES += \
    Updater

    endif
    ifneq ($(IS_OFFICIAL), true)
       XTENDED_BUILD_TYPE := UNOFFICIAL
       $(error Device is not official "$(CURRENT_DEVICE)")
    endif
endif

TARGET_PRODUCT_SHORT := $(subst xtended_,,$(XTENDED_BUILD))

XTENDED_VERSION := Xtended-$(XTENDED_MAJOR_VERSION)-$(XTENDED_RELEASE_VERSION)-$(XTENDED_BUILD)-$(XTENDED_BUILD_TYPE)-$(XTENDED_BUILD_DATE)

XTENDED_MOD_VERSION := $(XTENDED_MAJOR_VERSION)-$(XTENDED_RELEASE_VERSION)

ROM_FINGERPRINT := Xtended/$(XTENDED_MOD_VERSION)/$(TARGET_PRODUCT_SHORT)/$(XTENDED_BUILD_DATE)


CUSTOM_PROPERTIES += \
    ro.xtended.version=$(XTENDED_VERSION) \
    ro.xtended.display.version=$(XTENDED_MOD_VERSION) \
    ro.modversion=$(XTENDED_MOD_VERSION) \
    ro.xtended.buildtype=$(XTENDED_BUILD_TYPE) \
    com.xtended.fingerprint=$(ROM_FINGERPRINT)

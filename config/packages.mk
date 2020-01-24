#
# Copyright (C) The ConquerOS Project
# Copyright (C) The RyzenOS
#

# Telephony packages
PRODUCT_PACKAGES += \
    Stk

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs

# Root
PRODUCT_PACKAGES += \
    adb_root
ifneq ($(TARGET_BUILD_VARIANT),user)
ifeq ($(WITH_SU),true)
PRODUCT_PACKAGES += \
    su
endif
endif

# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml

# Pixel customization
TARGET_SUPPORTS_GOOGLE_RECORDER ?= true
TARGET_INCLUDE_STOCK_ARCORE ?= true
TARGET_INCLUDE_LIVE_WALLPAPERS ?= true
TARGET_SUPPORTS_QUICK_TAP ?= false

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images



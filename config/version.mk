# Copyright (C) 2016 The Pure Nexus Project
# Copyright (C) 2016 The JDCTeam
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

RYZEN_MOD_VERSION := Athlon
RYZEN_ANDROID = 13.0
RYZEN_BUILD_TYPE := XT

# XT = UNOFFICIAL
# X =  OFFICIAL

RYZEN_DATE_YEAR := $(shell date -u +%Y)
RYZEN_DATE_MONTH := $(shell date -u +%m)
RYZEN_DATE_DAY := $(shell date -u +%d)
RYZEN_DATE_HOUR := $(shell date -u +%H)
RYZEN_DATE_MINUTE := $(shell date -u +%M)
RYZEN_BUILD_DATE_UTC := $(shell date -d '$(RYZEN_DATE_YEAR)-$(RYZEN_DATE_MONTH)-$(RYZEN_DATE_DAY) $(RYZEN_DATE_HOUR):$(RYZEN_DATE_MINUTE) UTC' +%s)
RYZEN_BUILD_DATE := $(RYZEN_DATE_YEAR)$(RYZEN_DATE_MONTH)$(RYZEN_DATE_DAY)-$(RYZEN_DATE_HOUR)$(RYZEN_DATE_MINUTE)

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(RYZEN_OFFICIAL), true)
   LIST = $(shell cat infrastructure/devices/ryzen.devices | awk '$$1 != "#" { print $$2 }')
    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      IS_OFFICIAL=true
      RYZEN_BUILD_TYPE := X

    endif
    ifneq ($(IS_OFFICIAL), true)
       RYZEN_BUILD_TYPE := XT
       $(error Device is not official "$(CURRENT_DEVICE)")
    endif
endif

RYZEN_BUILD_VERSION := RyzenOS-$(RYZEN_MOD_VERSION)-$(RYZEN_ANDROID)-$(RYZEN_BUILD_TYPE)-$(CURRENT_DEVICE)-$(shell date -u +%Y%m%d)
RYZEN_VERSION := RyzenOS-$(RYZEN_MOD_VERSION)-$(RYZEN_ANDROID)-$(RYZEN_BUILD_TYPE)-$(CURRENT_DEVICE)-$(shell date -u +%Y%m%d)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.ryzen.version=$(RYZEN_MOD_VERSION) \
  ro.ryzen.android=$(RYZEN_ANDROID) \
  ro.ryzen.buildtype=$(RYZEN_BUILD_TYPE) \
  ro.ryzen.ziptype=$(RYZEN_BUILD_ZIP_TYPE) \
  ro.ryzen.build_date=$(RYZEN_BUILD_DATE) \
  ro.ryzen.build_date_utc=$(RYZEN_BUILD_DATE_UTC) \
  ro.aosp.revision=$(AOSP_REVISION)
  ro.ryzen.maintainer=$(RYZEN_MAINTAINER)

RYZEN_DISPLAY_VERSION := $(RYZEN_MOD_VERSION)-$(RYZEN_ANDROID)-$(RYZEN_BUILD_TYPE)-$(CURRENT_DEVICE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.ryzen.display.version=$(RYZEN_DISPLAY_VERSION)
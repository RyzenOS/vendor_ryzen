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
RYZEN_ANDROID = 13
RYZEN_BUILD_TYPE := XT

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

RYZEN_VERSION := RyzenOS-$(RYZEN_MOD_VERSION)-$(RYZEN_ANDROID)-$(RYZEN_BUILD_TYPE)-$(CURRENT_DEVICE)-$(shell date -u +%Y%m%d)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.ryzen.version=$(RYZEN_VERSION) \
  ro.ryzen.ziptype=$(RYZEN_BUILD_ZIP_TYPE) \
  ro.modversion=$(RYZEN_MOD_VERSION) \
  ro.aosp.revision=$(AOSP_REVISION)

RYZEN_DISPLAY_VERSION := Ryzen-$(RYZEN_MOD_VERSION)-$(RYZEN_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.ryzen.display.version=$(RYZEN_DISPLAY_VERSION)
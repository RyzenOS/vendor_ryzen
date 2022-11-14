# Copyright (C) 2020 The RyzenOS Project
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

RYZEN_TARGET_PACKAGE := $(PRODUCT_OUT)/$(RYZEN_BUILD_VERSION).zip
SHA256 := prebuilts/build-tools/path/$(HOST_OS)-x86/sha256sum

.PHONY: ryzen
ryzen: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(RYZEN_TARGET_PACKAGE)
	$(hide) $(SHA256) $(RYZEN_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(RYZEN_TARGET_PACKAGE).sha256sum
	@echo "Done"
	@echo -e "\t ===============================-Package complete-============================================================="
	@echo -e "\t Zip: $(RYZEN_TARGET_PACKAGE)"
	@echo -e "\t SHA256: `cat $(RYZEN_TARGET_PACKAGE).sha256sum | awk '{print $$1}' `"
	@echo -e "\t Size: `du -sh $(RYZEN_TARGET_PACKAGE) | awk '{print $$1}' `"
	@echo -e "\t RyzenOS $(RYZEN_VERSION)"
	@echo -e "\t =============================================================================================================="

# Copyright 2022 ReloadedOS
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

CLO_REVISION := LA.QSSI.14.0.r1-16000-qssi.0

AOSPAPLUS_VERSION_BASE := 1.0
AOSPAPLUS_BUILD_DATE := $(shell date +%Y%m%d)
AOSPAPLUS_BUILD_TYPE ?= UNOFFICIAL
AOSPAPLUS_BUILD_VARIANT := GAPPS

ifeq ($(AOSPAPLUS_BUILD_TYPE),OFFICIAL)
  OFFICIAL_DEVICES = $(shell cat vendor/aospa/aospaplus.devices)
    ifneq ($(filter $(TARGET_PRODUCT), $(OFFICIAL_DEVICES)),$(TARGET_PRODUCT))
      AOSPAPLUS_BUILD_TYPE := UNOFFICIAL
      $(warning Device is not official "$(TARGET_PRODUCT)")
    endif
endif

ifeq ($(VANILLA_BUILD),true)
AOSPAPLUS_BUILD_VARIANT := VANILLA
endif

# Example: AospaPlus-14.0-Marble-OFFICIAL-2024808-VANILLA
AOSPAPLUS_VERSION := AospaPlus-$(AOSPAPLUS_VERSION_BASE)-$(TARGET_PRODUCT)-$(AOSPAPLUS_BUILD_TYPE)-$(AOSPAPLUS_BUILD_DATE)-$(AOSPAPLUS_BUILD_VARIANT)

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.aospaplus.version=$(AOSPAPLUS_VERSION_BASE) \
    ro.aospaplus.build_date=$(AOSPAPLUS_BUILD_DATE) \
    ro.aospaplus.build_type=$(AOSPAPLUS_BUILD_TYPE) \
    ro.aospaplus.build_variant=$(AOSPAPLUS_BUILD_VARIANT) \
    ro.aospaplus.clo_revision=$(CLO_REVISION) \
    ro.aospaplus.device=$(TARGET_PRODUCT)

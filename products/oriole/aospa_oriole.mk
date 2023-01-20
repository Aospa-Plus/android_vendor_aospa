# Copyright (C) 2022 Paranoid Android
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

ifeq (aospa_oriole,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from the custom device configuration.
$(call inherit-product, device/google/raviole/aosp_oriole.mk)

include device/google/raviole/device-aospa.mk

# Inherit from the AOSPA configuration.
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

# Resolution for bootanimation
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_BRAND := google
PRODUCT_DEVICE := oriole
PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := Pixel 6
PRODUCT_NAME := aospa_oriole

PRODUCT_GMS_CLIENTID_BASE := android-google

# Override device name for Play Store.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=Pixel6 \
    PRIVATE_BUILD_DESC="oriole-user 13 TQ1A.230105.001 9325679 release-keys"

BUILD_FINGERPRINT := google/oriole/oriole:13/TQ1A.230105.001/9325679:user/release-keys

$(call inherit-product, vendor/google_devices/oriole/oriole-vendor.mk)

endif

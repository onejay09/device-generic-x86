#
# Copyright (C) 2014 The Android-x86 Open Source Project
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
#

PRODUCT_DIR := $(dir $(lastword $(filter-out device/common/%,$(filter device/%,$(ALL_PRODUCTS)))))

# build.prop overrides
PRODUCT_PROPERTY_OVERRIDES := \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.sf.lcd_density=160 \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=true

# root dir default prop addidtions
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1

# root dir default prop overrides
PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    persist.service.adb.enable=1 \
    ro.arch=x86 \
    persist.rtc_local_time=1 \
    ro.adb.secure=0

PRODUCT_COPY_FILES := \
    $(if $(wildcard $(PRODUCT_DIR)init.rc),$(PRODUCT_DIR)init.rc:root/init.rc) \
    $(if $(wildcard $(PRODUCT_DIR)init.sh),$(PRODUCT_DIR),$(LOCAL_PATH)/)init.sh:system/etc/init.sh \
    $(if $(wildcard $(PRODUCT_DIR)modules.blacklist),$(PRODUCT_DIR),$(LOCAL_PATH)/)modules.blacklist:system/etc/modules.blacklist \
    $(if $(wildcard $(PRODUCT_DIR)fstab.$(PRODUCT_RELEASE_NAME)),$(PRODUCT_DIR)fstab.$(PRODUCT_RELEASE_NAME),$(LOCAL_PATH)/fstab.x86):root/fstab.$(PRODUCT_RELEASE_NAME) \
    $(if $(wildcard $(PRODUCT_DIR)wpa_supplicant.conf),$(PRODUCT_DIR),$(LOCAL_PATH)/)wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(if $(wildcard $(PRODUCT_DIR)excluded-input-devices.xml),$(PRODUCT_DIR),$(LOCAL_PATH)/)excluded-input-devices.xml:system/etc/excluded-input-devices.xml \
    $(if $(wildcard $(PRODUCT_DIR)init.$(PRODUCT_RELEASE_NAME).rc),$(PRODUCT_DIR)init.$(PRODUCT_RELEASE_NAME).rc,$(LOCAL_PATH)/init.x86.rc):root/init.$(PRODUCT_RELEASE_NAME).rc \
    $(if $(wildcard $(PRODUCT_DIR)ueventd.$(PRODUCT_RELEASE_NAME).rc),$(PRODUCT_DIR)ueventd.$(PRODUCT_RELEASE_NAME).rc,$(LOCAL_PATH)/ueventd.x86.rc):root/ueventd.$(PRODUCT_RELEASE_NAME).rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ppp/ip-up:system/etc/ppp/ip-up \
    $(LOCAL_PATH)/ppp/ip-down:system/etc/ppp/ip-down \
    $(LOCAL_PATH)/ppp/peers/gprs:system/etc/ppp/peers/gprs \
    $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
    device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml \
	device/generic/android_x86/prebuilt/rtk_hciattach:/system/xbin/rtk_hciattach \
	device/generic/android_x86/prebuilt/96bt:/system/etc/init.d/96bt \
	device/generic/android_x86/prebuilt/98sound:/system/etc/init.d/98sound \
	device/generic/android_x86/prebuilt/99remix:/system/etc/init.d/99remix \
	device/generic/android_x86/prebuilt/rtlbt_fw:/system/lib/firmware/rtlbt_fw \
	device/generic/android_x86/prebuilt/bytcrrt5640.state:/system/etc/alsa/bytcrrt5640.state \
	device/generic/android_x86/prebuilt/alsa_cr.sh:/system/etc/alsa/alsa_cr.sh \
	device/generic/android_x86/prebuilt/alsa_cr_spk.sh:/system/etc/alsa/alsa_cr_spk.sh \
	device/generic/android_x86/prebuilt/rtlbt_config:/system/lib/firmware/rtlbt_config \
	device/generic/android_x86/prebuilt/rtlbt_fw:/system/lib/firmware/rtl_bt/rtlbt_fw \
	device/generic/android_x86/prebuilt/rtlbt_config:/system/lib/firmware/rtl_bt/rtlbt_config \
    device/sample/etc/old-apns-conf.xml:system/etc/old-apns-conf.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	device/generic/android_x86/prebuilt/adbkey:root/adb_keys/adbkey \
	device/generic/android_x86/prebuilt/adbkey.pub:root/adb_keys/adbkey.pub \
	device/generic/android_x86/prebuilt/adbkey:system/adb_keys/adbkey \
	device/generic/android_x86/prebuilt/adbkey.pub:system/adb_keys/adbkey.pub \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    $(foreach f,$(wildcard $(LOCAL_PATH)/alsa/*),$(f):$(subst $(LOCAL_PATH),system/etc,$(f))) \
    $(foreach f,$(wildcard $(LOCAL_PATH)/idc/*.idc $(LOCAL_PATH)/keylayout/*.kl),$(f):$(subst $(LOCAL_PATH),system/usr,$(f)))

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := normal large xlarge mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Get the firmwares
$(call inherit-product,device/generic/firmware/firmware.mk)

# Get the touchscreen calibration tool
$(call inherit-product-if-exists,external/tslib/tslib.mk)

# Get the alsa files
$(call inherit-product-if-exists,hardware/libaudio/alsa.mk)

# Get GPS configuration
#$(call inherit-product-if-exists,device/common/gps/gps_as.mk)

# Get the hardware acceleration libraries
$(call inherit-product-if-exists,$(LOCAL_PATH)/gpu/gpu_mesa.mk)

# Get the sensors hals
$(call inherit-product-if-exists,hardware/libsensors/sensors.mk)

# Get tablet dalvik parameters
$(call inherit-product,frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# Get GMS
$(call inherit-product-if-exists,vendor/google/products/gms.mk)

# Get native bridge settings
$(call inherit-product-if-exists,$(LOCAL_PATH)/nativebridge/nativebridge.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

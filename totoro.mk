# Copyright (C) 2010 The Android Open Source Project
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


# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# LDPI assets
PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

# Add device package overlay
DEVICE_PACKAGE_OVERLAYS := device/samsung/totoro/overlay

# Other
PRODUCT_PACKAGES += \
    gralloc.totoro \
    libaudioutils \
    libtinyalsa \
    setup_fs \

# Misc other modules
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default
	
# Video decoding
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libopencorehw \
    libmm-omxcore \
    libOmxCore


# These are the hardware-specific features
PRODUCT_COPY_FILES += \
        frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
        frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

#kernel modules
PRODUCT_COPY_FILES += \
    device/samsung/totoro/prebuilt/root/fsr.ko:root/fsr.ko \
    device/samsung/totoro/prebuilt/root/fsr_stl.ko:root/fsr_stl.ko \
    device/samsung/totoro/prebuilt/root/rfs_fat.ko:root/rfs_fat.ko \
    device/samsung/totoro/prebuilt/root/rfs_glue.ko:root/rfs_glue.ko \
    device/samsung/totoro/prebuilt/root/j4fs.ko:root/j4fs.ko \
    device/samsung/totoro/prebuilt/root/sec_param.ko:root/sec_param.ko
    
# Keylayout
PRODUCT_COPY_FILES += \
	device/samsung/totoro/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/samsung/totoro/prebuilt/usr/keylayout/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	device/samsung/totoro/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/samsung/totoro/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/totoro/prebuilt/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
	device/samsung/totoro/prebuilt/usr/keylayout/sec_keypad.kl:system/usr/keylayout/sec_keypad.kl

# Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/totoro/prebuilt/root/ueventd.gt-s5360.rc:root/ueventd.gt-s5360.rc \
    device/samsung/totoro/prebuilt/root/init.gt-s5360.rc:root/init.gt-s5360.rc

# Media profiles
PRODUCT_COPY_FILES += \
#    device/samsung/totoro/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml

#Wifi
PRODUCT_COPY_FILES += \
	device/samsung/totoro/prebuilt/bin/get_macaddrs:/system/bin/get_macaddrs \


# New SamsungRIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungRIL \
    mobiledata.interfaces=pdp0,eth0,gprs,ppp0

# Performance & graphics properties
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m \
    debug.camcorder.disablemeta=1 \
    debug.enabletr=false \
    hwui.render_dirty_regions=false \
    persist.sys.purgeable_assets=1 \
    persist.sys.ui.hw=1 \
    persist.sys.use_dithering=1 \
    ro.hwui.texture_cache_size=12 \
    ro.hwui.layer_cache_size=8 \
    ro.hwui.gradient_cache_size=0.25 \
    ro.hwui.path_cache_size=2 \
    ro.hwui.shape_cache_size=0.5 \
    ro.hwui.drop_shadow_cache_size=1 \
    ro.hwui.fbo_cache_size=8 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=120 \
    ro.vold.umsdirtyratio=20


PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1


# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# other kernel modules not in ramdisk
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/totoro/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/totoro/totoro-vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# NEW ICS properties (may need verification/testing)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage,adb \
    persist.service.adb.enable=1

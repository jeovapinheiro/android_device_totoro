# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := totoro

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/totoro/totoro.mk)

# Include FM-Radio stuff
#$(call inherit-product, vendor/cm/products/bcm_fm_radio.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_totoro
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := totoro
PRODUCT_MODEL := GT-s5360
PRODUCT_MANUFACTURER := samsung

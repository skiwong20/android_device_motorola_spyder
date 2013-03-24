#
# This is the product configuration for a full spyder
#
$(call inherit-product, device/motorola/omap4-kexec-common/common.mk)

DEVICE_FOLDER := device/motorola/spyder

# Device overlay
    DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay/aosp

# Hardware HALs
PRODUCT_PACKAGES += \
    power.spyder \
    camera.spyder \
    lights.spyder \
    hwcomposer.spyder

# Modem
PRODUCT_PACKAGES += \
    nc \
    Stk \
    libreference-cdma-sms

# Kexec rootfs files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/kexec/devtree:system/etc/kexec/devtree \
    $(OUT)/ramdisk.img:system/etc/kexec/ramdisk.img \
    $(OUT)/kernel:system/etc/kexec/kernel

# Prebuilts
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_FOLDER)/vold.fstab:system/etc/vold.fstab

# Add ubuntu conf
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/cdma_spyder.conf:system/etc/ubuntu-session.d/cdma_spyder.conf

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/motorola/spyder/spyder-vendor.mk)
$(call inherit-product-if-exists, vendor/motorola/spyder/spyder-vendor-stock-ducati.mk)
$(call inherit-product-if-exists, vendor/motorola/omap4-common/common-vendor-pvr.mk)

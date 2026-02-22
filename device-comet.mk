#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Kernel
TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := comet
TARGET_KERNEL_DIR := device/google/$(TARGET_KERNEL_DEVICE)-kernels/$(TARGET_LINUX_KERNEL_VERSION)
TARGET_KERNEL_PLATFORM_SOURCE := google/gs-$(TARGET_LINUX_KERNEL_VERSION)

# Shipping API level
SHIPPING_API_LEVEL := 34

# Inherit from zumapro
include device/google/zumapro/device-shipping-common.mk

# Fold extensions
PRODUCT_SYSTEM_SERVER_JARS += \
    system_ext:comet-services

# Hinge angle sensor
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.hinge_angle.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hinge_angle.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    device/google/comet/overlay-lineage

PRODUCT_PACKAGES += \
    ConnectivityResourcesOverlayCometOverride \
    DMServiceOverlayVendorComet \
    FrameworkResOverlayProductComet \
    FrameworkResOverlayVendorComet \
    GRilServiceOverlay_CT3 \
    LargeScreenConfigOverlay \
    LargeScreenSettingsProviderOverlay \
    NexusLauncherReleaseOverlayVendorComet \
    PixelDisplayServiceOverlayProductComet \
    PixelNfcOverlayComet \
    PixelUwbOverlayCT3 \
    PixelWifiOverlay2024Comet \
    SafetyRegulatoryInfoOverlayProductComet \
    SettingsCometOverlay \
    SettingsGoogleCometOverlay \
    SettingsGoogleOverlayProductComet \
    SettingsGoogleOverlayVendorComet \
    SettingsProviderOverlayVendorComet \
    SfpsOverlay \
    SystemUIGoogleOverlayProductComet \
    SystemUIGoogleOverlayVendorComet \
    TeleServiceOverlayVendorComet \
    TelecomOverlayProductComet

PRODUCT_PACKAGES += \
    ApertureOverlayComet

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.comet.rc

PRODUCT_PACKAGES += \
    init.recovery.comet.touch.rc

TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_RIGHT

# Satellite
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/conf/allowlist_satellite.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/allowlist_satellite.xml \
    frameworks/native/data/etc/android.hardware.telephony.satellite.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.satellite.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Thermal
PRODUCT_PACKAGES += \
    init_thermal_config

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/device_framework_matrix_product.xml

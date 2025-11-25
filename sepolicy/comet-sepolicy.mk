# sepolicy exclusively for comet.
BOARD_SEPOLICY_DIRS += device/google/comet/sepolicy/vendor

# system_ext
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += device/google/comet/sepolicy/system_ext/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/google/comet/sepolicy/system_ext/private

BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/bcmbt/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/display/sepolicy_second_display/exynos
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/gril/common/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/gril/hidl/1.7/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/gti/ical/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/gti/ical/sepolicy_gti_dual
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/gti/predump_sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/gti/predump_sepolicy_gti_dual
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/touch/predump/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += device/google/gs-common/wireless_charger/sepolicy

BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/powerstats
BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/vibrator/common
BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/vibrator/cs40l26

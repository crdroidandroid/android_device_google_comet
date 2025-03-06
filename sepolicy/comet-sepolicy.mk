# sepolicy exclusively for comet.
BOARD_SEPOLICY_DIRS += device/google/comet/sepolicy/vendor

# system_ext
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += device/google/comet/sepolicy/system_ext/public
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += device/google/comet/sepolicy/system_ext/private

BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/vibrator/common
BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/vibrator/cs40l26

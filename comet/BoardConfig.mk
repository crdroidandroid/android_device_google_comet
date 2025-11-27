#
# SPDX-FileCopyrightText: 2020 The Android Open-Source Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_BOARD_INFO_FILE := device/google/comet/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := comet
TARGET_SCREEN_DENSITY := 390

include device/google/zumapro/BoardConfig-common.mk
include device/google/comet/sepolicy/comet-sepolicy.mk
include device/google/comet/wifi/BoardConfig-wifi.mk

DEVICE_PATH := device/google/comet
VENDOR_PATH := vendor/google/comet
include $(DEVICE_PATH)/$(TARGET_BOOTLOADER_BOARD_NAME)/BoardConfigLineage.mk

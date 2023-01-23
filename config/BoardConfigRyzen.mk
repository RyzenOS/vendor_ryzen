include vendor/ryzen/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/ryzen/config/BoardConfigQcom.mk
endif

include vendor/ryzen/config/BoardConfigSoong.mk

deps_config := \
	/mnt/sdk/esp8266/RTOS_SDK/components/app_update/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/aws_iot/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/console/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/esp8266/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/esp_http_client/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/esp_http_server/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/freertos/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/libsodium/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/log/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/lwip/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/mdns/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/mqtt/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/newlib/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/pthread/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/spiffs/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/ssl/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/tcpip_adapter/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/util/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/vfs/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/wifi_provisioning/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/wpa_supplicant/Kconfig \
	/mnt/sdk/esp8266/RTOS_SDK/components/bootloader/Kconfig.projbuild \
	/mnt/sdk/esp8266/RTOS_SDK/components/esptool_py/Kconfig.projbuild \
	/mnt/sdk/esp8266/RTOS_SDK/components/partition_table/Kconfig.projbuild \
	/mnt/sdk/esp8266/RTOS_SDK/Kconfig

include/config/auto.conf: \
	$(deps_config)


$(deps_config): ;

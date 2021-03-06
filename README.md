# ESP8266 RTOS Software Development Kit IDF 
from 
https://github.com/espressif/ESP8266_RTOS_SDK

## About this repository
Moje drobne zmiany i poprawki do oficjalnego SDK 

# Developing With the ESP8266_RTOS_SDK
## Get toolchain

v5.2.0

* [Windows](https://dl.espressif.com/dl/xtensa-lx106-elf-win32-1.22.0-92-g8facf4c-5.2.0.tar.gz)
* [Mac](https://dl.espressif.com/dl/xtensa-lx106-elf-osx-1.22.0-92-g8facf4c-5.2.0.tar.gz)
* [Linux(64)](https://dl.espressif.com/dl/xtensa-lx106-elf-linux64-1.22.0-92-g8facf4c-5.2.0.tar.gz)
* [Linux(32)](https://dl.espressif.com/dl/xtensa-lx106-elf-linux32-1.22.0-92-g8facf4c-5.2.0.tar.gz)

If you are still using old version SDK(< 3.0), please use toolchain v4.8.5, as following:

* [Windows](https://dl.espressif.com/dl/xtensa-lx106-elf-win32-1.22.0-88-gde0bdc1-4.8.5.tar.gz)
* [Mac](https://dl.espressif.com/dl/xtensa-lx106-elf-osx-1.22.0-88-gde0bdc1-4.8.5.tar.gz)
* [Linux(64)](https://dl.espressif.com/dl/xtensa-lx106-elf-linux64-1.22.0-88-gde0bdc1-4.8.5.tar.gz)
* [Linux(32)](https://dl.espressif.com/dl/xtensa-lx106-elf-linux32-1.22.0-88-gde0bdc1-4.8.5.tar.gz)

## Get ESP8266_RTOS_SDK

Besides the toolchain (that contains programs to compile and build the application), you also need ESP8266 specific API / libraries. They are provided by Espressif in [ESP8266_RTOS_SDK](https://github.com/espressif/ESP8266_RTOS_SDK) repository. To get it, open terminal, navigate to the directory you want to put ESP8266_RTOS_SDK, and clone it using `git clone` command:

```
cd ~/esp
git clone https://github.com/michalzd/ESP8266_RTOS_IDS.git
```
ESP8266_RTOS_SDK will be downloaded into `~/esp/ESP8266_RTOS_SDK`.

## Start a Project
copy workspace/project_template to another folder
start project configuration utility `menuconfig`

make menuconfig

## Setup ESP8266_RTOS_SDK

`IDF_PATH` environment variable set in project Makefile 

## Connect

You are almost there. To be able to proceed further, connect ESP8266 board to PC, check under what serial port the board is visible and verify if serial communication works. Note the port number, as it will be required in the next step.

 ## Compiling the Project

`make all`

... will compile app based on the config.

## Flashing the Project

When `make all` finishes, it will print a command line to use esptool.py to flash the chip. However you can also do this from make by running:

`make flash`

This will flash the entire project (app, bootloader and init data bin) to a new chip. The settings for serial port flashing can be configured with `make menuconfig`.

You don't need to run `make all` before running `make flash`, `make flash` will automatically rebuild anything which needs it.

## Viewing Serial Output

The `make monitor` target uses the [idf_monitor tool](https://esp-idf.readthedocs.io/en/latest/get-started/idf-monitor.html) to display serial output from the ESP32. idf_monitor also has a range of features to decode crash output and interact with the device. [Check the documentation page for details](https://esp-idf.readthedocs.io/en/latest/get-started/idf-monitor.html).

Exit the monitor by typing Ctrl-].

To flash and monitor output in one pass, you can run:

`make flash monitor`
or 'screen /dev/ttyUSB0' 


## Compiling & Flashing Just the App

After the initial flash, you may just want to build and flash just your app, not the bootloader and init data bin:

* `make app` - build just the app.
* `make app-flash` - flash just the app.

`make app-flash` will automatically rebuild the app if it needs it.

(In normal development there's no downside to reflashing the bootloader and init data bin each time, if they haven't changed.)

> Note:
> Recommend to use these 2 commands if you have flashed bootloader and init data bin.

## Parallel Builds

ESP8266_RTOS_SDK supports compiling multiple files in parallel, so all of the above commands can be run as `make -jN` where `N` is the number of parallel make processes to run (generally N should be equal to or one more than the number of CPU cores in your system.)

Multiple make functions can be combined into one. For example: to build the app & bootloader using 5 jobs in parallel, then flash everything, and then display serial output from the ESP32 run:

```
make -j5 app-flash monitor
```

## Erasing Flash

The `make flash` target does not erase the entire flash contents. However it is sometimes useful to set the device back to a totally erased state. To erase the entire flash, run `make erase_flash`.

This can be combined with other targets, ie `make erase_flash flash` will erase everything and then re-flash the new app, bootloader and init data bin.


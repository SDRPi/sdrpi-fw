# sdrpi-fw
[SDRPi Firmware](https://github.com/HEXSDR/sdrpi-fw) for the [SDRPi](https://h5.m.taobao.com/awp/core/detail.htm?ft=t&id=678846437982) .
This project is forked from ADI [ADALM-PLUTO ](https://github.com/analogdevicesinc/plutosdr-fw) 
![SDRPi](./images/SDRPi.png)

## Purchase Link
For Chinese users: [SDRPi 淘宝链接](https://item.taobao.com/item.htm?id=647986963313#detail)

For Foreign users :Comming soon .

 

## Build Instructions

The SDRPi Firmware is built with the [Xilinx Vivado 2019.1](https://www.xilinx.com/member/forms/download/xef-vivado.html?filename=Xilinx_Vivado_SDK_Web_2019.1_0524_1430_Lin64.bin). You need to install the correct Vivado Version in your linux PC, and then, you can follow the instructions below to generate the firmware for [sdrpi](https://h5.m.taobao.com/awp/core/detail.htm?ft=t&id=678846437982) .

### Install build requirements

```bash
sudo apt-get install git build-essential fakeroot libncurses5-dev libssl-dev ccache -y 
sudo apt-get install dfu-util u-boot-tools device-tree-compiler mtools -y 
sudo apt-get install bc python cpio zip unzip rsync file wget  -y 
sudo apt-get install libtinfo5 device-tree-compiler bison flex u-boot-tools -y 
sudo apt-get purge gcc-arm-linux-gnueabihf -y 
sudo apt-get remove libfdt-de -y 
```

### Get source code and setup bash

```bash
git clone --recursive https://github.com/hexsdr/sdrpi-fw.git
export CROSS_COMPILE=arm-linux-gnueabihf- 
export PATH=$PATH:/tools/Xilinx/SDK/2019.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin 
export VIVADO_SETTINGS=/tools/Xilinx/Vivado/2019.1/settings64.sh
export PERL_MM_OPT=
```

### Building SDRPi firmware

```bash
cd sdrpi-fw 
make
```

## Make SD card boot image
After the firmware building finished, you can build the SD card boot image for [SDRPi](https://h5.m.taobao.com/awp/core/detail.htm?ft=t&id=678846437982). Just type the following command.
```bash
make sdimg
```
You will see the SD boot image in the build_sdimg folder. You can just copy all these files in that folder into a SD card, plug the SD card into the SDRPi, set the jumper into SD card boot mode.



### boot information for pluto firmware
When SDRPi is powered on, you can see the following message in serial port terminal.

```
U-Boot PlutoSDR v0.20-PlutoSDR-dirty-00055-g469a0fd988-dirty (Jul 13 2021 - 17:53:36 +0800)

I2C:   ready
DRAM:  ECC disabled 1 GiB
MMC:   sdhci@e0100000: 0
SF: Detected W25Q256 with page size 256 Bytes, erase size 4 KiB, total 32 MiB
*** Warning - bad CRC, using default environment

In:    serial@e0001000
Out:   serial@e0001000
Err:   serial@e0001000
Model: ANT SDR Board Test
reading uEnv.txt
7055 bytes read in 30 ms (229.5 KiB/s)
Importing environment from SD ...
Hit any key to stop autoboot:  0
Device: sdhci@e0100000
Manufacturer ID: 2
OEM: 544d
Name: SA16G
Tran Speed: 50000000
Rd Block Len: 512
SD version 3.0
High Capacity: Yes
Capacity: 14.4 GiB
Bus Width: 4-bit
Erase Group Size: 512 Bytes
reading uEnv.txt
7055 bytes read in 30 ms (229.5 KiB/s)
Loaded environment from uEnv.txt
Importing environment from SD ...
Copying Linux from SD to RAM...
reading uImage
4019688 bytes read in 365 ms (10.5 MiB/s)
reading devicetree.dtb
16967 bytes read in 32 ms (517.6 KiB/s)
reading uramdisk.image.gz
5709113 bytes read in 508 ms (10.7 MiB/s)
## Booting kernel from Legacy Image at 02080000 ...
   Image Name:   Linux-4.19.0-g6edc6cd24b48-dirty
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    4019624 Bytes = 3.8 MiB
   Load Address: 00008000
   Entry Point:  00008000
   Verifying Checksum ... OK
## Loading init Ramdisk from Legacy Image at 04000000 ...
   Image Name:
   Image Type:   ARM Linux RAMDisk Image (gzip compressed)
   Data Size:    5709049 Bytes = 5.4 MiB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 02000000
   Booting using the fdt blob at 0x2000000
   Loading Kernel Image ... OK
   Loading Ramdisk to 1fa8e000, end 1ffffcf9 ... OK
   Loading Device Tree to 1fa86000, end 1fa8d246 ... OK

Starting kernel ...

Booting Linux on physical CPU 0x0
......
......
......

Welcome to SDRPi
pluto login:

```
Then you can input 
username :root
password : analog

```

Welcome to SDRPi
sdrpi login: root
Password:
Welcome to:
 _________________ ______  _ 
/  ___|  _  \ ___ \| ___ \(_)
\ `--.| | | | |_/ /| |_/ / _
 `--. \ | | |    / |  __/ | |
/\__/ / |/ /| |\ \ | |    | |
\____/|___/ \_| \_|\_|    |_|

https://github.com/HexSDR/sdrpi-fw
# uname -a
Linux sdrpi 5.10.0-97859-g8b0d44b63524 #3 SMP PREEMPT Thu Nov 11 16:20:04 CST 2021 armv7l GNU/Linux
```

The sdrpi has an ethernet port, so you can connect the sdrpi to your SDR sofware through ethernet cable. The default IP address for ethernet port is **192.168.1.10**.

```
# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:0A:35:00:01:22
          inet addr:192.168.1.10  Bcast:0.0.0.0  Mask:255.255.255.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
          Interrupt:28 Base address:0xb000

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

usb0      Link encap:Ethernet  HWaddr 00:05:F7:19:E7:93
          inet addr:192.168.2.1  Bcast:0.0.0.0  Mask:255.255.255.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
```

<div align="center">
	<img src="assets/sugarlabs.png" height="50">
</div>
<br>
<div align="center">
	<img src="assets/sugar_rpi.png">
</div>
<br>


# Sugar OS for Raspberry Pi

This repository lets you generate a Raspberry Pi OS equipped with Sugar shell and add some additional activities.

**Activities that are pre-installed:**
- Flappy 
- RPI Control Center
- Number Guessing
- Tower of Hanoi
- Turtle Art
- Default activities (Calculate, Chat, Image Viewer, Pippy, Read, Terminal, Write and Browse)

## How to install
1. Download the OS from the [releases](https://github.com/sugarlabs/pi-gen/releases) page or from here: [SugarRPiOS-v1.0.0.zip](https://people.sugarlabs.org/aayush/Sugar-RPi-OS/os/SugarRPiOS-v1.0.0.zip).
2. Download and install [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
3. Open the Raspberry Pi Imager
       a. In the "Raspberry Pi Device" option select your Raspberry Pi model.
       b. In the "Operating System" option, scroll down, select "Use Custom" and then select the downloaded OS.
       c. In the "Storage" option select your micro SD card (it will be formatted)
       d. Click Next. Click on "Yes" when it prompts to configure the OS.
       e. Enter desired username and password (default username is 'pi' and password is 'pi')
       f. Continue to flash the OS.  
4. Once done, your micro SD card can be put into a Raspberry Pi and booted from.

## Generating OS
You must have *"Raspberry Pi Lite OS 32-bit OS"* installed on your Raspberry Pi to generate an OS. Yes, you need a Raspberry Pi to build an OS.

Once you have that, you can proceed to generate OS by following these steps:
- Clone this repo on your Raspberry Pi
- `cd sugar-rpi-os`
- Install the dependencies (from below)
- Run `sudo ./build.sh` 

If build process finishes successfully, you will find your sugar OS under `sugar-rpi-os/deploy` folder

If you wish to use docker, you can do so by `sudo ./build-docker.sh`\
([reference for docker usage](https://github.com/RPi-Distro/pi-gen/#:~:text=for%20finer%20details.-,Docker%20Build,are%20already%20set%20by%20the%20script%20and%20should%20not%20be%20redefined.,-Stage%20Anatomy)).


## Dependencies

To run the script one must install the required dependencies by running:

```bash
sudo apt-get install coreutils quilt parted qemu-user-static debootstrap zerofree zip \
dosfstools libarchive-tools libcap2-bin grep rsync xz-utils file git curl bc \
gpg pigz xxd arch-test
```

## Development

Check [pi-gen](https://github.com/RPi-Distro/pi-gen) to understand the structure and function of each step.

`Stage0` to `Stage2` builds the Raspberry Pi *Lite* OS\
`Stage3` is concerned with the setup of Sugar on top of it and then export the image.

Edit `Stage3` to add features/improvements

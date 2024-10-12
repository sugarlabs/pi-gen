# Sugar RPi OS

This repository lets you generate a Raspberry Pi OS equipped with Sugar shell and add some additional activities.

**Activities that are pre-installed:**
- Flappy 
- RPI Control Center
- Number Guessing
- Tower of Hanoi
- Turtle Art
- Default activities (Calculate, Chat, Image Viewer, Pippy, Read, Terminal, Write and Browse)


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


## Installation of the sugar OS

After the zip image is built under `deploy` folder. The image can then be flashed onto a microSD card using [rpi-imager](https://www.raspberrypi.com/software). 

In rpi-imager, under "Operating System" select "Use custom" option and then select the generated OS to flash. Username and password is also required to be set under Advanced option in the rpi-imager when prompted.


## Development

You can check the original repo [here](https://github.com/RPi-Distro/pi-gen/) to learn more about the structure and how to build upon it.\
`Stage3` is concerned with the setup of Sugar on top of the RPi-Lite OS.

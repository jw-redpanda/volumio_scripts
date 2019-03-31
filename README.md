# Simple setup script for volumio

This is a script to setup common tools/services for a freshly installed volumio.
The script has been tested on Raspberry Pi 3B.

## Getting Started

Boot up the Pi until you see the logon prompt.  Key in the default username and password - volumio.
To get started, make sure the Pi has LAN connection to internet.
This will download the script.

```
git clone https://github.com/jw-redpanda/volumio_scripts
```

To run the setup script, enter the command.  During setup, system may prompts for keeping config file that has been modified by volumio.  Press N to keep it.  In other case, if system prompts for sudo password, simply enter volumio.

```
cd volumio_scripts;
./scripts.sh

```

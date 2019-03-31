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

## Setup tasks

The script mainly setup FTP and SSH server.

### FTP Server

To connect to the FTP server, run a FTP client program (e.g. FileZilla), connect to server volumio, username/password is volumio. Try getting the ./ssh/ida_rsa_volumio private key file.  The file will be used for SSH client in the next step

### SSH Server

To connect to SSH server, run a SSH client program (e.g. PuTTY), connect to server volumio using private key obtained via .ssh/id_rsa_volumio.  Note that the private key file has to be converted into putty private key file by PuTTgen

Enjoy!

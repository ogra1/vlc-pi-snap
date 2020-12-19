## VLC snap built with accelerated playback support (MMAL) for Raspberry Pi

This snap of VLC is specifically created for the Raspberry Pi, it includes the MMAL (Multi-Media
Abstraction Layer) VLC patches from https://github.com/RPi-Distro/vlc, an MMAL patched version of
FFmpeg as found at https://github.com/RPi-Distro/ffmpeg and the accelerated videocore binaries
from https://github.com/raspberrypi/firmware.

Please make sure **your user is in the video group** to gain access to the /dev/vchiq device. 
If you have problems with fullscreen playback on a Pi4 or Pi400, make sure your screen is
connected to the correct HDMI output (this VLC can only play fullscreen on one of them and 
this is usually "the other one" :wink:).

Please make also sure to have the **hardware-observe interface** connected via

    sudo snap connect vlc-pi:hardware-observe

This snap is still experimental and requires to be installed with the **--devmode** flag
until https://github.com/snapcore/snapd/pull/9804 has been fixed in snapd.

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-white.svg)](https://snapcraft.io/vlc-pi)

## Building

This snap needs to be built on an armhf system, preferably inside an lxd container using the

    snapcraft --destructive-mode
    
command. The resulting multiarch binary is capable of running on armhf and arm64 systems.

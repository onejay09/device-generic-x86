# device-generic-x86
CM13 Device Tree for Cello-m8077_v2


device hardware:
ftsc1000 focaltech touchscreen same as asus transformer
rt5640 realtek sound codec
rtl8723bs wifi+bt
crystal cove pmic


whats working?
screen brightness with lpss patches
i915 with hardware acceleration
sound
all buttons
wifi
bluetooth

no crcpmic until a better driver is made for crystal cove


sound:
aif1 <-> ssp2
firmware used was fw_sst_0f28.bin.ssp2 renamed to /system/lib/firmware/fw_sst_0f28.bin
no quirks needed
kernel used is 4.9 with patches https://github.com/onejay09/kernel.git
bytrt5640.state in system/etc/alsa/ was the wrong name (bytcrrt5640.state)

a working bytcrrt5640.state i made by booting linuxium ubuntu.
steps: boot linuxium check that the byt5640 folder is added to /usr/share/alsa/ucm
run sudo alsactl store and a new alsa.state file will be created in /var/lib/alsa/
also needed was alsa_cr.sh + alsa_cr_spk.sh i added them to /etc/init.d/ and are run at boot time
this fixed the sound
all files i used can be found here in this build directory /Prebuilt/.

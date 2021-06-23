Certain Bluetooth earbuds would abruptly power off while both are being used.
This is mostly because of HSP not be enabled.
Run only if `pactl list` shows ```headset-head-unit: Headset Head Unit (HSP/HFP) (sinks: 1, sources: 1, priority: 0, available: no)``` or is completely not there.


execute `fake-modem-install.sh` as root to init all necessary configs and packages and enables a service.


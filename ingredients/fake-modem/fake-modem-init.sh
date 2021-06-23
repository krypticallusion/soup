#! /bin/bash

if ! pacman -Qs yay > /dev/null; then
	echo "Please install yay"
	exit
fi

if ! pacman -Qs phonesim > /dev/null; then
	echo "Installing phonesim"
	yay phonesim
fi

if ! pacman -Qs ofono > /dev/null; then
	echo "Installing Ofono"
	yay ofono
	sudo systemctl enable --now ofono
fi

if ! test -f "/etc/ofono/phonesim.conf"; then
	sudo bash -c 'cat > /etc/ofono/phonesim.conf' <<- EOM
	[phonesim]
	Address=127.0.0.1
	Driver=phonesim
	Port=12345
	EOM
fi

phonesim -p 12345 /usr/share/phonesim/default.xml &
dbus-send --print-reply --system --dest=org.ofono /phonesim org.ofono.Modem.SetProperty string:"Powered" variant:boolean:true > /dev/null
dbus-send --print-reply --system --dest=org.ofono /phonesim org.ofono.Modem.SetProperty string:"Online" variant:boolean:true > /dev/null

if pacman -Qs pipewire-pulse > /dev/null; then
	systemctl --user restart pipewire-pulse
else
	systemctl --user restart pulseaudio
fi

echo "All done!"



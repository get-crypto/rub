
Debian
====================
This directory contains files used to package rubd/rub-qt
for Debian-based Linux systems. If you compile rubd/rub-qt yourself, there are some useful files here.

## rub: URI support ##


rub-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install rub-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your rub-qt binary to `/usr/bin`
and the `../../share/pixmaps/rub128.png` to `/usr/share/pixmaps`

rub-qt.protocol (KDE)


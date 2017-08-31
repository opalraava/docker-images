blackarch/blackarch
===================

This is an installation of archlinux with the blackarch
repos enabled. It installs some basic applications from
the archlinux repo, such as xterm, firefox, xpdf, screen
and the standard networking tools such as dig, traceroute
tcpdump, nmap/zenmap. It also installs C/C++/python and
the editors gvim and emacs.


Some of the basic blackarch tools are already installed;
metasploit,armitage,vega scanner,openvas scanner,maltego.

## How to build and run
Use the provided Makefile to execute the relevant commands.
To build the image:
```
sudo make build
```
Next you need to set the user password:
```
sudo make up
sudo make ssh
```
The last command will drop you in a root shell inside the
container. In the container, specify the user password:
```
passwd user
exit
```
Now you can connect to the blackarch instance with ssh:
```
make ssh
```
And use the specified password to login.

The Makefile contains many useful commands such as backup
of volumes. The Makefile consists of simple commands and
should be quite readable, and function as a reminder of
how to do all the docker things.
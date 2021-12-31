# SSH-Email-Notifications
This is a way to get email notifications when logging in and out via SSH on a Linux based system.  

This has been tested on a RaspberryPi and an Ubuntu system.

## Download the script, put in place, and setup permissions
```shell
wget https://raw.githubusercontent.com/vanderblugen/SSH-Email-Notifications/main/notify-ssh-login.sh
sudo chown root:root notify-ssh-login.sh
sudo chmod a=rx notify-ssh-login.sh
sudo mv notify-ssh-login.sh /etc
```

## Edit File for Login Emailing

```shell 
sudo nano /etc/pam.d/sshd
```

Add in the following lines to the end of the file
```
# Notify on successful log in / log out.
session optional pam_exec.so /etc/notify-ssh-login.sh
```

Download file from this repo and put into appropriate location
```shell

```

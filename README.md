# SSH-Email-Notifications

## Finger is used in the script
To install that run this
```shell
sudo apt-get install finger -y
```

## Download the script, put in place, and setup permissions
```shell
wget https://raw.githubusercontent.com/vanderblugen/SSH-Email-Notifications/main/notify-ssh-login.sh
sudo chmod a=rx /etc/notify-ssh-login.sh
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

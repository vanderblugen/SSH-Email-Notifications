# SSH-Email-Notifications

## Finger is used in the script
To install that run this
```shell
sudo apt-get install finger -y
```

## Edit pam/sshd file

```shell 
sudo nano /etc/pam.d/sshd
```

Add in the following lines to the end of the file
```
# Notify on successful login / log out.
session optional pam_exec.so /etc/notify-ssh-login.sh
```

Download file from this repo and put into appropriate location
```shell

```

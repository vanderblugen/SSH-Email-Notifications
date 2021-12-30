# SSH-Email-Notifications

## Edit pam/sshd file

```shell 
sudo nano /etc/pam.d/sshd
```

Add in the following lines to the end of the file
```
# Notify on successful login / log out.
session optional pam_exec.so /etc/notify-ssh-login.sh
```

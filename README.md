# SSH-Email-Notifications

## Edit pam/sshd file

```shell 
sudo nano /etc/pam.d/sshd
```

Add in the following lines
```
echo "# Notify on successful login / log out." > 
echo "session optional pam_exec.so /etc/notify-ssh-login.sh" > 
```

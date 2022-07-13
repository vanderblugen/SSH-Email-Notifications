# SSH-Email-Notifications
This is a way to get email notifications when logging in and out via SSH on a Linux based system.  
Email notificaitons are sent via ```mail``` that are gpg encrypted.

This has been tested on a RaspberryPi and an Ubuntu system.

## Download the [Script](https://github.com/vanderblugen/SSH-Email-Notifications/blob/main/notify-ssh-login.sh)
```shell
wget https://raw.githubusercontent.com/vanderblugen/SSH-Email-Notifications/main/notify-ssh-login.sh
```

## Modify the Email Address in the Script
```shell
nano notify-ssh-login.sh
```

Change `recipient_email@address` to the appropriate email address.

### If GPG is not installed/configured Do This

Replace

```shell
cat $THISFILENAME | gpg -ear "<recipient_email@address>" | mail -a "Subject: Alert - Remote SSH $LOGWHAT notification" -a "X-Custom-Header: yes" "recipient_email@address.com"
```

With

```shell
cat $THISFILENAME | mail -a "Subject: Alert - Remote SSH $LOGWHAT notification" -a "X-Custom-Header: yes" "recipient_email@address.com"
```

Press `<Ctrl+X>` and then `<Enter>` when finished to exit

## Setup permissions for the Script and Put It In Place

```shell
sudo chown root:root notify-ssh-login.sh
sudo chmod a=rx notify-ssh-login.sh
sudo mv notify-ssh-login.sh /etc
```

## Edit SSHD file to Trigger Emailing

```shell 
sudo nano /etc/pam.d/sshd
```

Add in the following lines to the end of the file

```shell
# Notify on successful log in / log out.
session optional pam_exec.so /etc/notify-ssh-login.sh
```

Press `<Ctrl+X>` and then `<Enter>` when finished to exit

# All Set
Log out of the system to verify functionality.  

An email should be sent after logging in and out of the system via SSH now.

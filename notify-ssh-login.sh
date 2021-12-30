#!/bin/bash
PATH=/bin:/usr/bin:/usr/sbin
THISFILENAME="$(openssl rand -hex 8).txt"

if [ -z "$PAM_TYPE" -o "$PAM_TYPE" == "open_session" ]
then
LOGWHAT="LOGIN"
(
cat <<END
$(hostname) $(date): LOGIN by ${PAM_USER} from ${PAM_RHOST}
$(who)
END
) >> $THISFILENAME

else
LOGWHAT="LOG OUT"
(
cat <<END
$(hostname) $(date): LOG OUT by ${PAM_USER} from ${PAM_RHOST}
END
) >> $THISFILENAME


fi

echo " " >> $THISFILENAME
echo " " >> $THISFILENAME
echo "**********************************************" >> $THISFILENAME
echo " " >> $THISFILENAME
echo " " >> $THISFILENAME
df --output=target,pcent >> $THISFILENAME
echo " " >> $THISFILENAME
echo " " >> $THISFILENAME
echo "**********************************************" >> $THISFILENAME
echo " " >> $THISFILENAME
echo " " >> $THISFILENAME
env >> $THISFILENAME
echo " " >> $THISFILENAME
echo " " >> $THISFILENAME

cat $THISFILENAME | gpg -ear "<recipient_email@address>" | mail -a "Subject: Alert - Remote SSH $LOGWHAT notification" -a "X-Custom-Header: yes" "recipient_email@address.com"

shred -uvz  $THISFILENAME

unset THISFILENAME LOGWHAT




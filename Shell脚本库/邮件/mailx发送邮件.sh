#! /bin/bash

# mailx发送邮件，-r参数指定发件人邮箱，-s参数指定邮件主题
echo $datetime "warning:$alert_message"|mailx -r $sysname@triagen.com -s "$hostname  $alert_type" $maillist 
#!/bin/sh
INSTANCE_ID=`/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id`
# mysql -u root -e "drop database \``echo ${INSTANCE_ID} | sed s/-/_/g`\`;"
# mysql -u root -e "drop database \`test\`;"
yum clean all
# service nginx stop
# service mysql stop
# service php-fpm stop
rm -rf /tmp/*
rm -f /etc/ssh/ssh_host_*
rm -f /var/log/httpd/*.log
# rm -f /var/lib/mysql/ib_logfile*
rm -rf /var/tmp/php/session/*
# if [ -d /var/www/vhosts ]; then
#   rm -rf /var/www/vhosts/*
# fi
cd /var/log
ls -F | grep -v / | xargs -L1 cp /dev/null
yes | cp /dev/null /var/log/audit/audit.log
yes | cp /dev/null /root/.ssh/authorized_keys
yes | cp /dev/null /root/.bash_history
yes | cp /dev/null /root/.mysql_history
if [ -d /home/ec2-user ]; then
  yes | cp /dev/null /home/ec2-user/.ssh/authorized_keys
  yes | cp /dev/null /home/ec2-user/.bash_history
  yes | cp /dev/null /home/ec2-user/.mysql_history
fi
history -c
echo "clear!"

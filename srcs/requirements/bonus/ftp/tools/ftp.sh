service vsftpd start


# Add a user for FTP access
adduser $FTP_USER --disabled-password

# Set the password for the FTP user
echo "$FTP_USER:$FTP_PASSWD" | /usr/sbin/chpasswd &> /dev/null

# Add the FTP user to the vsftpd user list
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist &> /dev/null


# Create directories for FTP access
mkdir /home/$FTP_USER/ftp
chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp

# Create a directory for storing files
mkdir /home/$FTP_USER/ftp/files
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

# Stop vsftpd service
service vsftpd stop

# Start vsftpd service
/usr/sbin/vsftpd













# sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
# sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf

# echo "
# local_enable=YES
# allow_writeable_chroot=YES
# pasv_enable=YES
# local_root=/home/sami/ftp
# pasv_min_port=40000
# pasv_max_port=40005
# userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
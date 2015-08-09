#T o connect to a remote machine using ssh, type ssh username@ domain.name at a she

ssh username@domain.name

#remounts the named file system

mount -o remount /root
mount -o remount /home

#T o see the version of a currently installed package

#rpm -q package name 

sudo rpm -q httpd

##Chapter 2. Date and Time Configuration
##T his chapter covers setting the system date and time in Red Hat Enterprise Linux, both manually and
#using the Network T ime Protocol (NT P), as well as setting the adequate time zone

#################################################################
###Command Line Configuration

su -
##change the current date type the following command replacing yyyy-mm-dd with four digit year, Two digit month, and Two digit day of month

date +%D -s yyyy-mm-dd
date +%D -s 2013-12-23
date 

##change the current date type the following command replacing hh-mm-ss with Two digit hour, Two digit minute, and Two digit second
date +%T -s hh:mm:ss
date +%T -s 11:59:00

##If your system clock is set to use UT C (Coordinated Universal T ime), add the following option:

date +%T -s hh:mm:ss -u
date +%T -s 12:00:00 -u  

##Output =Sat Aug  2 12:00:00 EDT 2014

#########################################################


##The timezone is set to EST. To view exact details, enter:

date

#OUTPOUT= Sat Jan 29 06:21:38 EST 2011

cat /etc/sysconfig/clock 	

#Output= ZONE="America/New_York"
#		UTC=true
#		ARC=false


######To set your timezone to IST, enter following command 

TZ='Asia/Kolkata'
export TZ

Or 

export TZ='Asia/Kolkata'

##Now Time Zone Display in IST (Indian Statndard Time)

date

#OUTPUT = Sat Jan 29 16:54:46 IST 2011
#####################################################

###How Do I Make the TZ Changes Permanent?

###Linux / UNIX: TZ(TIME ZONE) Environment Variable
###You are you are able to change your Time zone permanently by adding following line to the file  .profile of your home directory

TZ='Asia/Kolkata' 
export TZ

##or 

export TZ='Asia/Kolkata'

##or 

TZ='Asia/Kolkata'; export TZ
######################################################

##How to Set time Zone using Posix TZ format 

TZ='POSIX-format'
export TZ

####
#How to set time zone GST which is 10 Hour ahead of UTC East Time Zone

TZ='GST-10'
export TZ
date

##How to Sysc Hardare Cloack with New Time Zone Setting

/sbin/hwclock --systohc

###If you have the utility “rdate“, update the current system time by executing

rdate -s time-a.nist.gov

#rdate [-p] [-s] [-u] [-l] [-t sec] [host...]

#Option
#       -p     Print the time returned by the remote machine.

#       -s     Set the system time to the returned time.


#       -u     Use UDP instead of TCP as the transport.

#       -l     Use syslog to output errors (cron.warning) and output (cron.info).

#       -t     Set timeout in seconds for every attempt to retreive date.



###################################################

##How to Find out Time zone Installed on linux 

tzselect

#Command Line OutPut=

Please identify a location so that time zone rules can be set correctly.
Please select a continent or ocean.
 1) Africa
 2) Americas
 3) Antarctica
 4) Arctic Ocean
 5) Asia
 6) Atlantic Ocean
 7) Australia
 8) Europe
 9) Indian Ocean
10) Pacific Ocean
11) none - I want to specify the time zone using the Posix TZ format.
#? 5
Please select a country.
 1) Afghanistan		  18) Israel		    35) Palestine
 2) Armenia		  19) Japan		    36) Philippines
 3) Azerbaijan		  20) Jordan		    37) Qatar
 4) Bahrain		  21) Kazakhstan	    38) Russia
 5) Bangladesh		  22) Korea (North)	    39) Saudi Arabia
 6) Bhutan		  23) Korea (South)	    40) Singapore
 7) Brunei		  24) Kuwait		    41) Sri Lanka
 8) Cambodia		  25) Kyrgyzstan	    42) Syria
 9) China		  26) Laos		    43) Taiwan
10) Cyprus		  27) Lebanon		    44) Tajikistan
11) East Timor		  28) Macau		    45) Thailand
12) Georgia		  29) Malaysia		    46) Turkmenistan
13) Hong Kong		  30) Mongolia		    47) United Arab Emirates
14) India		  31) Myanmar (Burma)	    48) Uzbekistan
15) Indonesia		  32) Nepal		    49) Vietnam
16) Iran		  33) Oman		    50) Yemen
17) Iraq		  34) Pakistan
#? 14 
The following information has been given:

	India

Therefore TZ='Asia/Kolkata' will be used.
Local time is now:	Mon Aug  4 01:09:37 IST 2014.
Universal Time is now:	Sun Aug  3 19:39:37 UTC 2014.
Is the above information OK?
1) Yes
2) No
#? 1
You can make this change permanent for yourself by appending the line
	TZ='Asia/Kolkata'; export TZ
to the file '.profile' in your home directory; then log out and log in again.

Here is that TZ value again, this time on standard output so that you
can use the /usr/bin/tzselect command in shell scripts:
Asia/Kolkata
######################################################################################

#Network Time Protocol Setup

#1. Firstly, check whether the selected NT P server is accessible:
ntpdate -q server_address

ntpdate -q google.com
#Output=
server 173.194.33.40, stratum 0, offset 0.000000, delay 0.00000
server 173.194.33.41, stratum 0, offset 0.000000, delay 0.00000
server 173.194.33.46, stratum 0, offset 0.000000, delay 0.00000
server 173.194.33.32, stratum 0, offset 0.000000, delay 0.00000
# 3 Aug 15:52:42 ntpdate[25075]: no server suitable for synchronization found

ntpdate -q 0.rhel.pool.ntp.org
#Output
server 108.166.189.70, stratum 3, offset 79.158607, delay 0.10110
server 198.55.111.50, stratum 3, offset 79.156315, delay 0.05890
server 205.233.73.201, stratum 2, offset 79.163454, delay 0.09486
server 50.7.64.4, stratum 2, offset 79.159676, delay 0.11766
# 3 Aug 15:54:32 ntpdate[25092]: step time server 205.233.73.201 offset 79.163454 sec

#When you find a satisfactory server, run the ntpdate command followed by one or more server

ntpdate 0.rhel.pool.ntp.org

##

ntpdate 0.rhel.pool.ntp.org 1.rhel.pool.ntp.org

###
#permanently on ntpdate service 

chkconfig ntpdate on
service ntpdate start

#########################################

*****************************************************************************************************

if the synchronization with the time server at boot time keeps failing, i.e., you find a relevant

error message in the /var/log/boot.log system log, try to add the following line to

****************************************************************************************************
#/etc/sysconfig/network:

NETWORKWAIT=1

#	one more convinient way to sync  time at boot time open vi /etc/ntp.conf file and add following line

server 0.rhel.pool.ntp.org iburst
server 1.rhel.pool.ntp.org iburst
server 2.rhel.pool.ntp.org iburst
server 3.rhel.pool.ntp.org iburst

#If you are using Red Hat Enterprise Linux 6, the file should already contain the following lines, but feel free to change or expand these according to your needs: 
#The iburst directive at the end of each line is to speed up the initial synchronization.

##Once you have the list of servers complete, in the same file, set the proper permissions, giving the
###unrestricted access to localhost only:

restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict -6 ::1


###Save all changes, exit the editor, and restart the NT P daemon:

service ntpd restart

##Make sure that ntpd is started at boot time:

chkconfig ntpd on

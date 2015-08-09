*********************************************************************************************************
HOW TO INSTALL MYSQL SERVER ON UBUNTU14.04 & REDHAT6.5 & CENTOS6.5  64 BIT OPERATING SYSTEM 
*********************************************************************************************************



**********************************************************************************************************
			HOW TO STARt, STATUS, RESTART & PERMANENT ON  MYSQL SERTVICE
**********************************************************************************************************
service mysqld restart
#OUTPUT
Stopping mysqld:                                           [  OK  ]
Starting mysqld:                                           [  OK  ]

service mysqld start
#OUTPUT=
Starting mysqld:                                           [  OK  ]

service mysqld status
#OUTPUT=
mysqld (pid  7806) is running...

#PERMANENT ON
chkconfig mysqld on
***********************************************************************************************************
			HOW TO RECOVER ROOT PASSWORD IN LINUX 
***********************************************************************************************************

#Step 1 : Stop mysql service

-----------------------------------------------------
/etc/init.d/mysql stop
#	or 
service mysqld start
#Output:
Stopping MySQL database server: mysqld.

------------------------------------------------------

#Step 2: Start to MySQL server w/o password:

-------------------------------------------------------
mysqld_safe --skip-grant-tables &
#Output:
[1] 5988
Starting mysqld daemon with databases from /var/lib/mysql
mysqld_safe[6025]: started

----------------------------------------------------------

#Step 3: Connect to mysql server using mysql client:

----------------------------------------------------------
mysql -u root
#Output:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1 to server version: 4.1.15-Debian_1-log
Type 'help;' or '\h' forr help. Type '\c' to clear the buffer.
mysql>

----------------------------------------------------------

#Step 4: Setup new MySQL root user password

----------------------------------------------------------
mysql> use mysql;
mysql> update user set password=PASSWORD("NEW-ROOT-PASSWORD") where User='root';
mysql> flush privileges;
mysql> quit

#Step 5: Stop MySQL Server:

/etc/init.d/mysql stop
 	OR
service mysqld stop
#Output:

Stopping MySQL database server: mysqld
STOPPING server from pid file /var/run/mysqld/mysqld.pid
mysqld_safe[6186]: ended
[1]+  Done                    mysqld_safe --skip-grant-tables

------------------------------------------------------------
#Step 6: Start MySQL server and test it

/etc/init.d/mysql start
#	OR
service mysqld start

mysql -u root -p
#OUTPUT:-
password (NEWPASSWORD)

*******************************************************************************************************
		HOW TO Restore / repair / reset mysql root privileges
*******************************************************************************************************
cat > restore_root_privileges.sql

update mysql.user set Super_priv='y' where user='root';
update mysql.user set Select_priv='y' where user='root';
update mysql.user set Insert_priv='y' where user='root';
update mysql.user set Update_priv='y' where user='root';
update mysql.user set Delete_priv='y' where user='root';
update mysql.user set Create_priv='y' where user='root';
update mysql.user set Drop_priv='y' where user='root';
update mysql.user set Reload_priv='y' where user='root';
update mysql.user set Shutdown_priv='y' where user='root';
update mysql.user set Process_priv='y' where user='root';
update mysql.user set File_priv='y' where user='root';
update mysql.user set Grant_priv='y' where user='root';
update mysql.user set References_priv='y' where user='root';
update mysql.user set Index_priv='y' where user='root';
update mysql.user set Alter_priv='y' where user='root';
update mysql.user set Show_db_priv='y' where user='root';
update mysql.user set Super_priv='y' where user='root';
update mysql.user set Create_tmp_table_priv='y' where user='root';
update mysql.user set Lock_tables_priv='y' where user='root';
update mysql.user set Execute_priv='y' where user='root';
update mysql.user set Repl_slave_priv='y' where user='root';
update mysql.user set Repl_client_priv='y' where user='root';
update mysql.user set Create_view_priv='y' where user='root';
update mysql.user set Show_view_priv='y' where user='root';
update mysql.user set Create_routine_priv='y' where user='root';
update mysql.user set Alter_routine_priv='y' where user='root';
update mysql.user set Create_user_priv='y' where user='root';

----------------------------------------------------------------------------------------------
sudo /etc/init.d/mysql stop
sudo mysqld --skip-grant-tables &
mysql -vv < restore_root_privileges.sql

sudo /etc/init.d/mysql restart
mysql -u root -p
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
mysql> quit;


********************************************************************************************************
		HOW TO ALLOW MYSQL SERVER ACCESS FROM REMOTE COMPUTER 
********************************************************************************************************

STEP-1:- Edit vi /etc/my.cnf file and one line [ bind-address=0.0.0.0 ] OR [ bind-address = * ]

---------------------------------------------------------------------------------------------------------
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
bind-address=0.0.0.0
#skip-networking

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
#	bind-address=0.0.0.0 mean allow all available IP-Address
#	bind-address=127.0.0.1 mean allow only localhost
#	bind-address= * mean allow all available IP-Address
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

STEP-2: RESTART THE MYSQL SERVICE

/etc/init.d/mysql start
#	OR
service mysqld start

----------------------------------------------------------------------------------------------------------

STEP-3:- LOGIN ON MYSQL SHELL

----------------------------------------------------------------------------------------------------------

mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 6
Server version: 5.1.73 Source distribution

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' forr help. Type '\c' to clear the current input statement.

mysql> 

----------------------------------------------------------------------------------------------------------

STEP-4:- ENTER FOLLOWING COMMAND ON MYSQL LOGIN SHELL

----------------------------------------------------------------------------------------------------------

1. # GRANT ALL PRIVILEGES ON *.* TO username@'HOSTNAME/IP-ADDRESS' IDENTIFIED BY 'PASSWORD';
This command allow to access all database with specific user with specific HOST/IPADDRESS. 



2. # GRANT ALL PRIVILEGES ON *.* TO username@'%' IDENTIFIED BY 'PASSWORD';
This command allow to access all database with specific user with all Available IPADDRESS.
 

3. # GRANT ALL PRIVILEGES ON databases-name.* TO username@'%' IDENTIFIED BY 'PASSWORD';
This command allow to access specified database with specific user with all Available IPADDRESS.
 

4. # GRANT ALL PRIVILEGES ON database-name.* TO username@'HOSTNAME/IP-ADDRESS' IDENTIFIED BY 'PASSWORD';
This command allow to access specified database with specific user with specific HOST/IPADDRESS.

---------------------------------------------------------------------------------------------------------------

STEP-5:- YOU HAVE FLUSH ALL PRIVILEGES

---------------------------------------------------------------------------------------------------------------
FLUSH PRIVILEGES;
EXIT;

****************************************************************************************************************

	HOW TO SET MASTER SLAVE SET UP IN CENTOS6.5/REDHAT6.5 AND UBUNTU 12.04 

****************************************************************************************************************
We need to have Two SERVER one forr MASTER And other forr SLAVE

REDHAT6-5 --MASTER = 54.191.27.247 
UBUNTU12.04--SLAVE = 54.186.81.55

-----------------------------------------------------------------------------------------------------------------
	
	STEP-1 :- Configure Master Server (54.191.27.247) forr Replication

------------------------------------------------------------------------------------------------------------------


#Install mysql Server on Master 

yum install mysql-server mysql

------------------------------------------------------------------------------------------------------------------
#Configure a MySQL in Master Server by editing vi /etc/my.cnf and following line 
------------------------------------------------------------------------------------------------------------------
server-id = 1
binlog-do-db=databasename 
relay-log = /var/lib/mysql/mysql-relay-bin
relay-log-index = /var/lib/mysql/mysql-relay-bin.index
log-error = /var/lib/mysql/mysql.err
master-info-file = /var/lib/mysql/mysql-master.info
relay-log-info-file = /var/lib/mysql/mysql-relay-log.info
log-bin = /var/lib/mysql/mysql-bin

-------------------------------------------------------------------------------------------------------------------
# RESTART THE MYSQL SERVER ON MASTER 
-------------------------------------------------------------------------------------------------------------------

/etc/init.d/mysqld restart

---------------------------------------------------------------------------------------------------------------------
# Login in MASTER SERVER mysql shell with root user and create a SLAVE SERVER_USER & grant privileges for Replcation 
# Replace SLAVE_USER with user and Password with Password.
---------------------------------------------------------------------------------------------------------------------
mysql> GRANT REPLICATION SLAVE ON *.* TO 'root'@'%' IDENTIFIED BY 'sunday1980';
mysql> FLUSH PRIVILEGES;
mysql> FLUSH TABLES WITH READ LOCK;
mysql> SHOW MASTER STATUS;
#OUTPUT:-
+------------------+----------+--------------+------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB |
+------------------+----------+--------------+------------------+
| mysql-bin.000003 | 11128001 | databasename |                  |
+------------------+----------+--------------+------------------+
1 row in set (0.00 sec)

mysql> quit;

#Please write down the File (mysql-bin.000003) and Position (11128001) numbers, we required these numbers later on Slave server. 
#Next apply READ LOCK to databases to export all the database and master database information with mysqldump command.
---------------------------------------------------------------------------------------------------------------------------------

# NOW Take the DUMP of All Databases you have to replicate.

mysqldump -u root -p --all-databases --master-data > /root/dbdump.db


# Now again connect to mysql as root user and unlcok tables.
mysql> UNLOCK TABLES;
mysql> quit;
------------------------------------------------------------------------------------------------------------------------------------
Upload the database dump file on Slave Server (54.186.81.55) using SCP command.

scp -rfv dbdump.db root@54.186.81.55:./

*************************************************************************************************************************************
	STEP-2:- CONFIGURE SLAVE ON UBUNTU SERVER (54.186.81.55) 
*************************************************************************************************************************************
# Once you have configured the master database. You can put it aside for a while, and we will now begin to configure the slave database.

# Install mysql server on Slave Server(Ubuntu) 

sudo apt-get install mysql-server mysql-client

# Login Myqsl shell 
mysql -u root -p 
password:-

# Create a new database
mysql>CREATE DATABASE newdatabase;
mysql>EXIT;

# Import the database that you previously exported from the master database.
mysql -u root -p newdatabase < /path/to/dbdump.sql

# Now we need to configure the slave configuration in the same way as we did the master:
# We have to add following line in sudo vi /etc/mysql/my.cnf

sudo vi /etc/mysql/my.cnf
OUTPUT:-
------------------------------------------------------------------------------------------------------------------------------------------
#
# The MySQL database server configuration file.
#
# You can copy this to one of:
# - "/etc/mysql/my.cnf" to set global options,
# - "~/.my.cnf" to set user-specific options.
# 
# One can use all long options that the program supports.
# Run program with --help to get a list of available options and with
# --print-defaults to see which it would actually understand and use.
#
# For explanations see
# http://dev.mysql.com/doc/mysql/en/server-system-variables.html

# This will be passed to all mysql clients
# It has been reported that passwords should be enclosed with ticks/quotes
# escpecially if they contain "#" chars...
# Remember to edit /etc/mysql/debian.cnf when changing the socket location.
##################################################

[client]
port		= 3306
socket		= /var/run/mysqld/mysqld.sock

##################################################
# Here is entries for some specific programs
# The following values assume you have at least 32M ram

# This was formally known as [safe_mysqld]. Both versions are currently parsed.
##################################################

[mysqld_safe]
socket		= /var/run/mysqld/mysqld.sock
nice		= 0

[mysqld]

##################################################
#
# * Basic Settings
#
user		= mysql
pid-file	= /var/run/mysqld/mysqld.pid
socket		= /var/run/mysqld/mysqld.sock
port		= 3306
basedir		= /usr
datadir		= /var/lib/mysql
tmpdir		= /tmp
lc-messages-dir	= /usr/share/mysql
skip-external-locking

###################################################
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address		= 0.0.0.0
#
# * Fine Tuning
#
key_buffer		= 16M
max_allowed_packet	= 16M
thread_stack		= 192K
thread_cache_size       = 8
# This replaces the startup script and checks MyISAM tables if needed
# the first time they are touched
myisam-recover         = BACKUP
#max_connections        = 100
#table_cache            = 64
#thread_concurrency     = 10
#
# * Query Cache Configuration
#
query_cache_limit	= 1M
query_cache_size        = 16M
#
# * Logging and Replication
#
# Both location gets rotated by the cronjob.
# Be aware that this log type is a performance killer.
# As of 5.1 you can enable the log at runtime!
#general_log_file        = /var/log/mysql/mysql.log
#general_log             = 1
#
# Error log - should be very few entries.
#
log_error = /var/log/mysql/error.log
#
# Here you can see queries with especially long duration
#log_slow_queries	= /var/log/mysql/mysql-slow.log
#long_query_time = 2
#log-queries-not-using-indexes
#
# The following can be used as easy to replay backup logs or for replication.
# note: if you are setting up a replication slave, see README.Debian about
#       other settings you may need to change.
############################################################################################################################
server-id		= 2
relay-log               = /var/log/mysql/mysql-relay-bin.log
log_bin			= /var/log/mysql/mysql-bin.log
expire_logs_days	= 10
max_binlog_size         = 100M
binlog_do_db		= redhat
#############################################################################################################################
#binlog_ignore_db	= include_database_name
#
# * InnoDB
#
# InnoDB is enabled by default with a 10MB datafile in /var/lib/mysql/.
# Read the manual for more InnoDB related options. There are many!
#
# * Security Features
#
# Read the manual, too, if you want chroot!
# chroot = /var/lib/mysql/
#
# For generating SSL certificates I recommend the OpenSSL GUI "tinyca".
#
# ssl-ca=/etc/mysql/cacert.pem
# ssl-cert=/etc/mysql/server-cert.pem
# ssl-key=/etc/mysql/server-key.pem



[mysqldump]
quick
quote-names
max_allowed_packet	= 16M

[mysql]
#no-auto-rehash	# faster start of mysql but no tab completition

[isamchk]
key_buffer		= 16M

#
# * IMPORTANT: Additional settings that can override those from this file!
#   The files must end with '.cnf', otherwise they'll be ignored.
#
!includedir /etc/mysql/conf.d/

----------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------

# After saving this file restart Mysql Service.

sudo service mysql restart


# Now open Mysql Login Shell Enter following Detail 

#	SAMPLE OF COMMAND

mysql> CHANGE MASTER TO MASTER_HOST='Hostname/IPaddress' ,MASTER_USER='slave_user', MASTER_PASSWORD='password', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=  107;

#	Actual Cammand

mysql> CHANGE MASTER TO MASTER_HOST='54.191.27.247', MASTER_USER='root', MASTER_PASSWORD='sunday1980',MASTER_LOG_FILE='mysql-bin.000005', MASTER_LOG_POS=106;

myqsl> START SLAVE;

---------------------------------------------------------------------------------------------------------------------
# This Command consist of following information these are explain below

1.	MASTER TO MASTER_HOST 	= Master server IP Address(54.191.27.247)
2.	MASTER_USER 		= USERNAME CREATED FOR SLAVE AT MASTER SERVER SIDE 
3.	MASTER_PASSWORD 	= Password forr SLAVE USER CREATED AT MASTER SIDE 
4.	MASTER_LOG_FILE		= Copy Value of Master Server Log File Position 
5.	MASTER_LOG_POS		= Master Log Position 
-----------------------------------------------------------------------------------------------------------------

# How to check the SLAVE RUNNING STATUS

SHOW SLAVE STATUS\G
#OUTPUT:-
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: 54.191.27.247
                  Master_User: root
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: mysql-bin.000002
          Read_Master_Log_Pos: 647
               Relay_Log_File: mysql-relay-bin.000073
                Relay_Log_Pos: 252
        Relay_Master_Log_File: mysql-bin.000002
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB: 
          Replicate_Ignore_DB: 
           Replicate_Do_Table: 
       Replicate_Ignore_Table: 
      Replicate_Wild_Do_Table: 
  Replicate_Wild_Ignore_Table: 
                   Last_Errno: 0
                   Last_Error: 
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 647
              Relay_Log_Space: 553
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File: 
           Master_SSL_CA_Path: 
              Master_SSL_Cert: 
            Master_SSL_Cipher: 
               Master_SSL_Key: 
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error: 
               Last_SQL_Errno: 0
               Last_SQL_Error: 
  Replicate_Ignore_Server_Ids: 
             Master_Server_Id: 1
1 row in set (0.00 sec)
********************************************************************************************************************************





GRANT REPLICATION SLAVE ON *.* TO 'root'@'%' IDENTIFIED BY 'sunday1980';

CHANGE MASTER TO MASTER_HOST='54.191.27.247', MASTER_USER='root', MASTER_PASSWORD='sunday1980',MASTER_LOG_FILE='mysql-bin.000005', MASTER_LOG_POS=106;


 CHANGE MASTER TO MASTER_HOST='192.168.1.1', MASTER_USER='root', MASTER_PASSWORD='sunday1980', MASTER_LOG_FILE='mysql-bin.000003', MASTER_LOG_POS='411';

CHANGE MASTER TO MASTER_HOST='127.0.0.1', MASTER_PORT=3305, MASTER_USER='rep', MASTER_PASSWORD='password';





















































































sudo service mysqld start

Initializing MySQL database:  Installing MySQL system tables...
OK
Filling help tables...
OK

To start mysqld at boot time you have to copy
support-files/mysql.server to the right place for your system

PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
To do so, start the server, then issue the following commands:

/usr/bin/mysqladmin -u root password 'new-password'
/usr/bin/mysqladmin -u root -h ip-172-31-18-178 password 'new-password'

Alternatively you can run:
/usr/bin/mysql_secure_installation

which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.

See the manual for more instructions.

You can start the MySQL daemon with:
cd /usr ; /usr/bin/mysqld_safe &

You can test the MySQL daemon with mysql-test-run.pl
cd /usr/mysql-test ; perl mysql-test-run.pl

Please report any problems with the /usr/bin/mysqlbug script!

                                                           [  OK  ]
Starting mysqld:                                           [  OK  ]

*************************************************************************************************************************

			HOW TO Reset MYSQL ROOT PASSWORD IN REDHAT & CENTOS-6

*************************************************************************************************************************

/usr/bin/mysqladmin -u root password 'new-password'

Allow root user of mysql form all Host 

658-804-554	
9y6gr9
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password';

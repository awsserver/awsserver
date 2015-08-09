
###	Managing Users and Groups


###	What is User & Group


###	User are ny person which associated with an account & this account is exist for specific Application to use. User can read, write & 		execute files owned by group.
	1. Each User associated with a unique identification number called UID.
	2. A user who creates a file is also the owner and group of that file.
	3. File is assigned sparate read,Write and  execute permission forr OWNER,Group 
	4. File owner can be changed only by root user and Acces permission can be changed by both owner and root user 
	5. Redhat also provide a facility ACCCES CONTROL LIST [ACL] 4r files and directories which allow permission forr users outside the 
	owner.


###	Group are logical expression of organisation and users associated with specific application are tying together forr common purpose.
###	User within group can read, write & execute files owned by group.

	1. Each Group associated with a unique identification number called GID

	Details of user and Group are stored in directory /etc/passwd & /etc/group These files hold the information about user and groups
	whenever you add a new user all the information related to this user are added in /etc/passwd file at the same time a group with same
	name is also added in /etc/group

##################

###	Format of /etc/passwd file
	
	test:x:503:503: :/home/test:/bin/bash
	 1   2  3   4  5     6         7

	1. test =name of user or Login name
	2.  X = indicate encrypted password stored in /etc/shadow file 
	3. 503 = UID unique identification number 
	4. 503 = Primary GID found in /etc/group file 	
	5. For Comment user -c option with useradd command
	6. /home/test/ = Home Directory of User
	7. /bin/bash/ = shell used forr executing the command


# NOTE:- You can edit this file directly or by specified command 


################


###	Format of /etc/group file 

	test:x:503:users
	  1  2  3  4

	1. test=name of group
	2. x = indicate the encrypted password of group but not really used by group.
	3. 503 = GID of Group 
	4. users= All the Users who are associted with this group are mentioned here 

###################

##	EXAMPLES

Login with root privileges

su -

########################

##	How to Add a user in linux 

adduser test

	NOTE:- when a new user is created file from /etc/skel/ are copied into  its home directory 

########################
##	How to Change Default path of Home Directory of new user. 


useradd -d /home/sunnysharma test


#	NOTE:- -d option will only set the home directory not created it for user for -m option create the home directory 

useradd -d /home/sunnysharma -m test

su - 	test
echo $HOME 
or
pwd 
	
##############################
#	Format of Usermod command configuration file vi /etc/default/useradd

vi /etc/default/useradd

#OUTPUT:-
	GROUP=100
	HOME=/home
	INACTIVE=-1
	EXPIRE=
	SHELL=/bin/bash
	SKEL=/etc/skel
	CREATE_MAIL_SPOOL=yes


--->	Group= This is the Only Option which will not taken as default. If you are not using -n option with useradd command
		create a Group with same name as user created and user will be added to that group. So to avoid that and to 
		make the user member of Default Group we are -n option with useradd command.

--->	Home=	This is the default path for home directory of new user. By Default path is /home/username.

--->	INACTIVE= The value of this is set to -1 by default. This feature diable the account after password has expired. For enable
		  This feature you have to assign +ve value.

---> EXPIRE=	The Date on which user account will be disabled.

---> SHELL=	User Login Shell.

---> SKEL=	content of skel directory copied in user home directory 

---> CREATE_MAIL_SPOOL = According to value creates or not mail spool forr user.

*************************************************************************************
NOTE:- You are see the content useradd file with this command 

useradd -D

#OUTPUT=

	GROUP=100
	HOME=/home
	INACTIVE=-1
	EXPIRE=
	SHELL=/bin/bash
	SKEL=/etc/skel
	CREATE_MAIL_SPOOL=yes



*************************************************************************************

**********SYNTAX FOR USERADD COMMAND WITH DIFFERENT OPTION************************

useradd -s [SHELL] -m -d [HOME DIR] -g [GROUP NAME] [username]  

useradd  -s /bin/sh -m -d /home/newhome/aman -g kadmin aman


cd /home/
ls
ec2-user  kadmin  newhome  sunny  test

grep aman /etc/passwd
aman:x:504:501::/home/newhome:/bin/sh

grep aman /etc/shadow
aman:!!:16288:0:99999:7:::

grep aman /etc/group

grep kadmin /etc/group
kadmin:x:501:

###############################
#		HOW TO CREATE CUSTOM CONFIGURATION FOR USERADD COMMAND
###############################

useradd -u [UID] -s [SHELL] -m -d [HOME DIR] -g [GROUP NAME] -c "COMMENT" [username]


useradd  -u 505 -s /bin/sh -m -d /home/amitsharmanew -g kadmin -c "amit sharma" amit

grep amit /etc/passwd
amit:x:505:501:amit sharma:/home/amitsharmanew:/bin/sh
				
**************************************************************************************
		HOW TO CREATE NEW USER WITH NEWUSERS COMMAND 
**************************************************************************************
Follow These Step
1. Create a file with given format 
2. Execute that file with newusers command.

############################################################

	HOW TO CREATE MORE THAN ONE USER FOR SAME GROUP

cat homefamily.txt
manoj:sunday1980:1010:1000:sunny sharma:/home/manoj:/bin/bash
suresh:sunday19801:1020:1000:sunny sharma:/home/suresh:/bin/bash
ramesh:sunday19802:1020:1000:sunny sharma:/home/ramesh:/bin/bash
devesh:sunday19803:1040:1000:sunny sharma:/home/devesh:/bin/bash	

newusers homefamily.txt
ls

amitsharmanew  devesh  ec2-user  home.txt  kadmin  manoj  newhome  ramesh  sunny  suresh  test

grep manoj /etc/passwd
manoj:x:1010:1000:sunny sharma:/home/manoj:/bin/bash

grep suresh /etc/passwd
suresh:x:1020:1000:sunny sharma:/home/suresh:/bin/bash

grep ramesh /etc/passwd
ramesh:x:1020:1000:sunny sharma:/home/ramesh:/bin/bash

grep devesh /etc/passwd
devesh:x:1040:1000:sunny sharma:/home/devesh:/bin/bash

#############################################################

************************************************************************************************************************

			NOTE:-	HOW TO CREATE MORE THAN ONE USER or THOUSAND USER 	
				HOW TO CREATE MORE THAN ONE GROUP or THOUSAND GROUP	
				HOW TO DELETE MORE THAN ONE USER or THOUSAND USER
				HOW TO DELETE MORE THAN ONE GROUP or THOUSAND GROUP

************************************************************************************************************************
SCRIPT FOR CREATE USER:-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
for USER in card card1 card2 card3 card4 card5 card6
do 
useradd $USER
echo  friends |passwd --stdin $USER
done
 		
		OR

for USER in vinita nikkita niddhi sumit shweta vickey kaushal manoj jai
do
useradd $USER
echo friends |passwd --stdin $USER
done 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


SCRIPT FOR CREATE GROUP:-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
for GROUP in sale market tech
do 
groupadd $GROUP
done
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


SCRIPT FOR DELETE USER:-
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
for USER in vinita nikkita niddhi sumit shweta vickey kaushal manoj jai
do
userdel -r $USER
done 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SCRIPT FOR DELET GROUP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
for GROUP in sales market productions
do
groupdel $GROUP
done 

##################################################################################################################

***********************************************************************************************************************
***********************************************************************************************************************

IN THIS ARTICAL YOU WILL LEARN ABOUT THE USER VARIABLE AND PROFILE. USER SESSION IS CONTROLLED BY SOME PROFILE FILE. 
THESE FILE ARE LOCATED IN /etc/skel/ WHEN YOU CREATE A NEW USER THESE FILE ARE COPIED IN THE USER HOME DIRECTORY. WHEN 
YOU CREATED A USER HOME DIRECTORY MANUALLY WITH -m OPTION IN THESE SITUATION YOU NEED TO COPY THESE FILE MANUALLY.

************************************************************************************************************************
************************************************************************************************************************
FORMAT OF vi .bash_profile 

OUTPUT=

# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

********************************************************************************************************************
1. This file instruct user to check .bashrc file forr user aliases and function.

2. This file also set user command path.if you want to set the path of your command to your home directory.
How to set path forr your command.

********************************************************************************************************************

FORMAT OF vi .bash_profile 

OUTPUT=

# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/home/kadmin

export PATH
 
****************************************************************************************************************

Format of vi .bashrc

OUTPUT:-
# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

*****************************************************************************************************************
*****************************************************************************************************************

#	What is ALIAS command 

ALIAS command is used to create a another name for command. it doesn`t replace the name of that command simply provide a new
name to that command.

#	HOW TO CREATE ALIAS IN LINUX 

Format for creating an alias 

alias aliasname='commandname'

for creating a permanent alias you have to made entry in .bashrc file 
-----------------------------------------------------------------------------------------
vi .bashrc

alias rm='rm -i'
alias startnetwork='sudo /etc/init.d/network restart'

Now you are able to restart networking server by simply type startnetwork command 

------------------------------------------------------------------------------------------

HOW TO STOP LOGOUT FROM CURRENT SESSION BY PRESS CTRL + D 


set -o ignoreeof
[root@ip-172-31-18-178 ~]# Press Ctrl +D
[root@ip-172-31-18-178 ~]# Use "exit" to leave the shell.

set +o ignoreeof

[root@ip-172-31-18-178 ~]# press ctrl +D
[root@ip-172-31-18-178 ~]# logout

----------------------------------------------------------------------------------------









#####################################

sudo useradd -n aman


grep aman /etc/passwd
aman:x:504:100::/home/aman:/bin/bash

grep aman /etc/group

OUTPUT:-
No Group Found with Name aman


#######################################
	 						
	CREATE A USER WITHOUT PASSWORD
passwd -d aman
Removing password for user aman.
passwd: Success

su - aman

#OUTPUT=
[aman@ home]

 







##############################

##	 How to Delete a User & Home Directory  in Linux System

## 	DELETE A User	

userdel test

############################
##	DELETE User home Directory as well

userdel -r test

############################

##	How to change the password of user 

password username

password test

#############################

##	How to add a user into a Group

##	1. If group is already created first confim by run following command

grep groupname /etc/group
grep test /etc/group

#OUTPUT
test:x:503:

grep username /etc/passwd
grep test /etc/passwd
#OUTPUT:
test:x:503:503::/home/test:/bin/bash

****************************************
#NOTE: -Now i have to change the Primary grop of user test and assign a other group 

#	1. 	First of all create a new group with groupadd command 
#	2. 	after that -g option is used to change the primary group and -G option is used Usermod to assigne other group to user.
#	3. 	after tha
****************************************

groupadd sunny

grep sunny /etc/group

#OUTPUT:-
sunny:x:502:


groupdel sunny

###################################
	HOW TO ADD A USER IN ROOT 
###################################
usermod -G root test


usermod -gsunny -Gtest test

grep test /etc/passwd
#OUTPUT:-
test:x:503:502::/home/test:/bin/bash


grep test /etc/group
#OUTPUT:-
test:x:503:test
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
				In above example we had changed the primary and other group of user name test.
				Before that primary group of user test is test whose GID[503] but after that the
				Primary group of user test has been changed to sunny whose GID[502]. 
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>






#Now for login in this account you have to use SU command (SWITCH USER Command)	You can use this command in two way 
1. su username

2. su - username

**********
 NOTE:- When you are using Su - it mean su will execute the login proile and all envorment variable and alias with in the user are avialble.

*********
#######################

## 	How to Delete a User in Linux

userdel test



#############################################################################################

##	What is User Private Groups?
	Redhat linux uses a user private group (UPG). Which makes linux group easier to manage.
	A user Private group added to system whenever a new user added to system. It has same name 
	as the user forr which it is created and user is only member of this group.

##	What is Umask? IMPORTANT
	Umask is a utility which decide which permission are applied to files and directory and umask is configured in /etc/bashrc file.
	Traditionally umask is set to 022 which allows only user who create the file are allow to make modification in the directory and file.
	Under this scheme all other users who are member of the creator group are not allowed to do modification

## 	What is Shodow Password /??
	Where we are using multi users enviroment it is very important to use shadow passwords provided by shodow utils pakages.
	In /etc/shadow file store the actual passowrd of user in encrypted forr users account with additional properties related to user 		password. All Field are separated by (:).
	
	1. Shadow password store information about the password aging.
	2. Shadow password allow /etc/login.defs file to enforce security policies

-----------------------------------------------------------------------------------------------------
	Shadow password improve the system security because it encrypt the password one important feature of /etc/shadow file is that,
	only by root user 
########################################################
## Format of /etc/shadow [Important]

	kadmin:$1$CL4yaH9t$aaPTYzKemAF3F8XhJ4yye.:16286:0:99999:7: : :
	  |	       |			    |   |   |   | | |
	  1	       2                            3   4   5   6 7 8

	1. Username:Login Name 
	2. Password: Encrypted Password. Passord should be 6 to 8 character long include special character.
	3. Last Password change:Days Since That Password was changed.
	4. Minimum: The Min number of days required between password change(Number days left before the user allowed to change	password).
	5. Maximum: The Max number of days password is valid after that user is force to change his/her password.
	6. warn: The Number of days before the password is to expire that user is warned that his/her password must be changed. 
	7. inactiv: The number of days after password expire and account disabled.
	8. Expire: Day Since that account disabled i.e. an absolute date specifying when the login may no longer to be used.

According to man Page of shodow file password must be filled it is not remain empty.
If Encrypted password start with $ mean it is not encrypted by DES Algorithem it mean it is encrypted by MD5 Algorithem
Password character is of 64 character a to z , A to Z and 0 to 9

-------------------------------------------------------------------------------------------------------------------

NOTE:- Most of the shadow utils packages works properly weather or not shadow password are enabled.


#####################################################


##	Which command are used to change password aging information?

	chage command are used to modified the password aging information here are some example of chage command 
################################################	

chage -h

#OUTPUT:-
Options:
  -d, --lastday LAST_DAY        set date of last password change to LAST_DAY
  -E, --expiredate EXPIRE_DATE  set account expiration date to EXPIRE_DATE
  -h, --help                    display this help message and exit
  -I, --inactive INACTIVE       set password inactive after expiration
                                to INACTIVE
  -l, --list                    show account aging information
  -m, --mindays MIN_DAYS        set minimum number of days before password
                                change to MIN_DAYS
  -M, --maxdays MAX_DAYS        set maximim number of days before password
                                change to MAX_DAYS
  -R, --root CHROOT_DIR         directory to chroot into
  -W, --warndays WARN_DAYS      set expiration warning days to WARN_DAYS


##############################################

#	Consider User Created on Date 04-August-2014

##############################################
date 
#OUTPUT:
Mon Aug  4 10:25:57 EDT 2014

sudo adduser sunny

chage -l sunny

#OUTPUT	

sudo chage -l sunny

#OUTOUT

Last password change					: Aug 04, 2014
Password expires					: never
Password inactive					: never
Account expires						: Aug 05, 2014
Minimum number of days between password change		: 0
Maximum number of days between password change		: 99999
Number of days of warning before password expires	: 7
#########################################
##	EXAMPLE of chage Command.
#	7 Examples to Manage Linux Password Expiration and Aging Using chage	

#########################################
##	How to find Password aging Details
##	A root user can execute chage command for each user.

chage --list username 
chage --list root

#OUTPUT
Last password change					: Aug 04, 2014
Password expires					: never
Password inactive					: never
Account expires						: never
Minimum number of days between password change		: 0
Maximum number of days between password change		: 99999
Number of days of warning before password expires	: 7

############################################

# If a user change its password on 05/August/2014 then [Last Password change] value update with date on which password has been updated.

date
Mon Aug  5 10:35:05 EDT 2014

####
adduser sunny
passwd sunny
Changing password forr user sunny.
New password: 
Retype new password: 
passwd: all authentication tokens updated successfully.

##############

chage --list sunny

#OUTPUT
Last password change					: Aug 05, 2014
Password expires					: never
Password inactive					: never
Account expires						: never
Minimum number of days between password change		: 0
Maximum number of days between password change		: 99999
Number of days of warning before password expires	: 7

##############

# 	How Set Expiry Date of Password for a user with Chage Command

chage -M 1 sunny

chage --list sunny
#OUTPUT
Last password change					: Aug 05, 2014
Password expires					: Aug 06, 2014
Password inactive					: never
Account expires						: never
Minimum number of days between password change		: 0
Maximum number of days between password change		: 1
Number of days of warning before password expires	: 7

###############

##	How to Set Password Expiry Warning message during login
##	By Default password expiry value set to 7

chage -W 10 sunny

chage --list sunny

Last password change					: Aug 04, 2014
Password expires					: never
Password inactive					: never
Account expires						: never
Minimum number of days between password change		: 0
Maximum number of days between password change		: 99999
Number of days of warning before password expires	: 10

##############
ssh sunny@54.187.145.35

sunny@54.187.145.35  password: 
Warning: your password will expire in 10 day

#############

##	Set the Account Expiry Date for an User	

chage -E "2014-08-05" sunny

chage -l sunny

#OUTPUT=
Last password change					: Aug 04, 2014
Password expires					: never
Password inactive					: never
Account expires						: Aug 05, 2014
Minimum number of days between password change		: 0
Maximum number of days between password change		: 9999999
Number of days of warning before password expires	: 10

############

##	Force the user account to be locked after X number of inactivity days

chage -I 10 sunny

chage -l sunny
#OUTPUT=
Last password change					: Aug 04, 2014
Password expires					: Aug 14, 2014
Password inactive					: Aug 24, 2014
Account expires						: Aug 04, 2014
Minimum number of days between password change		: 0
Maximum number of days between password change		: 10
Number of days of warning before password expires	: 10

############
#  NOTE:- In this Example password inctive  date is set to 10 days from the password expire values
#	Example

chage -W 10 -E "2014-08-20" -M 8 -I 5 sunny

chage -l sunny

# OUTPUT
Last password change					: Aug 04, 2014
Password expires					: Aug 12, 2014
Password inactive					: Aug 17, 2014
Account expires						: Aug 20, 2014  
Minimum number of days between password change		: 0
Maximum number of days between password change		: 8
Number of days of warning before password expires	: 10

#NOTE: 	Password expire hoga 20 Aug ko, 10 Aug ko warning dega password chage karne ke liye, Password change karne ke liye 8 din ka diffrence 		hoga matlab 12  Aug ko password change kar sakte hai, 17 August ko password inactive ho jayega.


###########

##	How to disable password aging for an user account
	

    -m 0 will set the minimum number of days between password change to 0
    -M 99999 will set the maximum number of days between password change to 99999
    -I -1 (number minus one) will set the “Password inactive” to never
    -E -1 (number minus one) will set “Account expires” to never.


#################################################################################################################################





	

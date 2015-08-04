from fabric.contrib.files import append, sed, upload_template
from fabric.api import local, run, env, put, sudo, roles, execute, parallel
import os, time
from fabric.api import *

env.hosts = ['localhost','10.128.0.4','10.128.0.1','10.128.0.2','10.128.0.3','10.128.0.4']
env.user = 'kadmin'
env.password = 'sunday198012'
env.forward_agent = True

def runs_in_parallel():
    pass

def copy():
    # make sure the directory is there!
    run('mkdir -p /home/kadmin/mynewfolder')

    # our local 'localdirectory' (it may contain files or subdirectories)
    put('/home/kadmin/python/log_archive.pl', '/home/kadmin/mynewfolder')
    #run('echo "0 * * * *       perl /usr/local/bin/perl /home/kadmin/mynewfolder/log_archive.pl" >>  /etc/crontab', use_sudo=True)
    append('/etc/crontab', '0 * * * *       perl /usr/local/bin/perl /home/kadmin/mynewfolder/log_archive.pl', use_sudo=True)

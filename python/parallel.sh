cat $INPUT_FILE | while read l;do {

SERVER=($l)
CHK=`ssh -t -q -o "BatchMode yes" -o "ConnectTimeout 5" -l $USER $SERVER "echo success"`;

if [ "success" = $CHK ] >/dev/null 2>&1
then
  ret=`ssh -n -t -q -o "BatchMode yes" -o "ConnectTimeout 5" -l $USER $SERVER '/home/username/timer.sh testvar;echo $?'`
  echo "return: [$ret]"
  if [ $ret -eq 0 ]; then
       echo "Success. Aborting"
       break
  fi
else
  printf "${i}\tUnable to connect to host\n";
fi
} < /dev/null; done


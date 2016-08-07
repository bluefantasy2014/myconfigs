# /usr/sbin/lsof and /sbin/ifconfig are not included in the current PATH
export PATH=${PATH}:/sbin/:/usr/sbin/

export P4PORT=p4server.us.oracle.com:6999
export P4PORT_ctl=p4server.us.oracle.com:6999
export P4USER=jijun.shi
export P4CLIENT=jijun.shi.slc08vqv
export P4PASSWD=xxxxx

export dev1214=/scratch/jijshi/dev/src1214
#export WEBLOGICHOME=/scratch/jijshi

#export JAVA_HOME=/scratch/jijshi/dev/auto_download/x86_64/jdk18051b16/jdk1.8.0_51

function setenv(){
  cd $dev1214
  . ./devenv.sh
  cd wlstest
  . ./qaenv.sh
}

alias pswl='ps -ef | grep weblogic'
alias ls='ls --color'

# jndi_dump t3://slc08vqv.us.oracle.com:7001 system gumby1234
function jndi_dump() {
  cd /scratch/jijshi/jndi_dump
  java -classpath "/scratch/jijshi/src1214_build/Oracle_Home/wlserver/server/lib/weblogic.jar:./" JNDIDump -url ${1} -user ${2} -pass ${3}
}

# wlstats t3://slc08vqv.us.oracle.com:7001 system gumby1234
function wlstats(){
  url=${1}
  user=${2}
  pass=${3}

  cd /scratch/jijshi/wlstats
  java -cp ${CLASSPATH}:./wlstats.jar:/scratch/jijshi/src1214_build/Oracle_Home/wlserver/server/lib/weblogic.jar wlstats.WLStats -colwidth 100 -wide -url ${url} -user ${user} -pass ${pass} -allservers
}

# wlstats_1 t3://slc08vqv.us.oracle.com:7001 system gumby1234
function wlstats_1(){
  url=${1}
  user=${2}
  pass=${3}

  echo 'before removing paras:' ${@}
  cd $dev1214
  set -- "${@:0:0}"
  echo 'after removing paras:' ${@}
  . ./devenv.sh
  cd /scratch/jijshi/wlstats
  java -cp ${CLASSPATH}:./wlstats.jar wlstats.WLStats -colwidth 100 -wide -url ${url} -user ${user} -pass ${pass} -allservers
}

#just for testing
function test_123 (){
  echo 'before :'${@} ' :' $#
  set -- "${@:1:1}" "${@:3:3}"
  echo 'after :'${@} ' :' $#
  cd /home/jijshi/my_shell
  . ./test1.sh
}

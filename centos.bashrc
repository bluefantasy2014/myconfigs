# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=${PATH}:/usr/local/java/bin
export JAVA_HOME=/usr/local/java

export MongoHome=/data/welabx/mongodb
export SolrHome=/data/welabx/solr/solr-6.2.1

ERLANG_HOME=/usr/local/erlang
PATH=$ERLANG_HOME/bin:$PATH
export ERLANG_HOME
export PATH

#ln -s /usr/local/erlang/bin/erl /usr/bin/erl


function startmongo(){
  cd $MongoHome
  ./mongo/bin/mongod --dbpath=${MongoHome}/data --logpath=${MongoHome}/logs/mongodb.log --logappend &
}


function stopsolr(){
  cd $SolrHome
  ./bin/solr stop 
}
function startsolr(){
  cd $SolrHome
  ./bin/solr start &
}


function mqstatus(){
   /sbin/service rabbitmq-server status 
}

function stopmq(){
   /sbin/service rabbitmq-server stop 
}

function startmq(){
   /sbin/service rabbitmq-server start 
}

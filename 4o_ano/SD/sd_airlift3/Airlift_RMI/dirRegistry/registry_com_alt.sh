CODEBASE="file:///home/$1/sd_airlift3/Airlift_RMI/dirRegistry/"
java -cp .:./genclass.jar -Djava.rmi.server.codebase=$CODEBASE\
     -Djava.rmi.server.useCodebaseOnly=false\
     -Djava.security.policy=java.policy\
     serverSide.main.ServerRegisterRemoteObject 22001 localhost 22000

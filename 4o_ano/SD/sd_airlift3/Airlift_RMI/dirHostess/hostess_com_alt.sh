CODEBASE="file:///home/$1/sd_airlift3/Airlift_RMI/dirHostess/"
java -cp .:./genclass.jar -Djava.rmi.server.codebase=$CODEBASE\
     -Djava.rmi.server.useCodebaseOnly=false\
     clientSide.main.ClientHostess localhost 22000

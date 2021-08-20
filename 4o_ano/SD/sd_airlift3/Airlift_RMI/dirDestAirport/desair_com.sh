CODEBASE="http://l040101-ws05.ua.pt/"$1"/classes/"
java -cp .:genclass.jar -Djava.rmi.server.codebase=$CODEBASE\
     -Djava.rmi.server.useCodebaseOnly=true\
     -Djava.security.policy=java.policy\
     serverSide.main.ServerDestAirport $2 $3 $4

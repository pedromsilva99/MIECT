echo "Compiling source code."
javac -cp .:./genclass.jar */*.java */*/*.java
echo "Distributing intermediate code to the different execution environments."
echo "  RMI registry"
rm -rf dirRMIRegistry/interfaces
mkdir -p dirRMIRegistry/interfaces
cp interfaces/*.class dirRMIRegistry/interfaces
echo "  Register Remote Objects"
rm -rf dirRegistry/serverSide dirRegistry/interfaces
mkdir -p dirRegistry/serverSide dirRegistry/serverSide/main dirRegistry/serverSide/objects dirRegistry/interfaces
cp serverSide/main/ServerRegisterRemoteObject.class dirRegistry/serverSide/main
cp serverSide/objects/RegisterRemoteObject.class dirRegistry/serverSide/objects
cp interfaces/Register.class dirRegistry/interfaces

echo "  General Repository of Information"
rm -rf dirGeneralRepos/serverSide dirGeneralRepos/clientSide dirGeneralRepos/interfaces
mkdir -p dirGeneralRepos/serverSide dirGeneralRepos/serverSide/main dirGeneralRepos/serverSide/objects dirGeneralRepos/interfaces \
         dirGeneralRepos/clientSide dirGeneralRepos/clientSide/entities
cp serverSide/main/SimulPar.class serverSide/main/ServerGeneralRepos.class dirGeneralRepos/serverSide/main
cp serverSide/objects/GeneralRepos.class dirGeneralRepos/serverSide/objects
cp interfaces/Register.class interfaces/GeneralReposInterface.class dirGeneralRepos/interfaces
cp clientSide/entities/HostessStates.class clientSide/entities/PilotStates.class clientSide/entities/PassengerStates.class dirGeneralRepos/clientSide/entities

echo "  Departure Airport"
rm -rf dirDepAirport/serverSide dirDepAirport/clientSide dirDepAirport/interfaces dirDepAirport/commInfra
mkdir -p dirDepAirport/serverSide dirDepAirport/serverSide/main dirDepAirport/serverSide/objects dirDepAirport/interfaces \
         dirDepAirport/clientSide dirDepAirport/clientSide/entities dirDepAirport/commInfra
cp serverSide/main/SimulPar.class serverSide/main/ServerDepAirport.class dirDepAirport/serverSide/main
cp serverSide/objects/DepAirport.class dirDepAirport/serverSide/objects
cp interfaces/*.class dirDepAirport/interfaces
cp clientSide/entities/HostessStates.class clientSide/entities/PilotStates.class clientSide/entities/PassengerStates.class dirDepAirport/clientSide/entities
cp commInfra/*.class dirDepAirport/commInfra

echo "  Plane"
rm -rf dirPlane/serverSide dirPlane/clientSide dirPlane/interfaces dirPlane/commInfra
mkdir -p dirPlane/serverSide dirPlane/serverSide/main dirPlane/serverSide/objects dirPlane/interfaces \
         dirPlane/clientSide dirPlane/clientSide/entities dirPlane/commInfra
cp serverSide/main/SimulPar.class serverSide/main/ServerPlane.class dirPlane/serverSide/main
cp serverSide/objects/Plane.class dirPlane/serverSide/objects
cp interfaces/*.class dirPlane/interfaces
cp clientSide/entities/HostessStates.class clientSide/entities/PilotStates.class clientSide/entities/PassengerStates.class dirPlane/clientSide/entities
cp commInfra/*.class dirPlane/commInfra

echo "  Destination Airport"
rm -rf dirDestAirport/serverSide dirDestAirport/clientSide dirDestAirport/interfaces dirDestAirport/commInfra
mkdir -p dirDestAirport/serverSide dirDestAirport/serverSide/main dirDestAirport/serverSide/objects dirDestAirport/interfaces \
         dirDestAirport/clientSide dirDestAirport/clientSide/entities dirDestAirport/commInfra
cp serverSide/main/SimulPar.class serverSide/main/ServerDestAirport.class dirDestAirport/serverSide/main
cp serverSide/objects/DestAirport.class dirDestAirport/serverSide/objects
cp interfaces/*.class dirDestAirport/interfaces
cp clientSide/entities/HostessStates.class clientSide/entities/PilotStates.class clientSide/entities/PassengerStates.class dirDestAirport/clientSide/entities
cp commInfra/*.class dirDestAirport/commInfra

echo "  Pilot"
rm -rf dirPilot/serverSide dirPilot/clientSide dirPilot/interfaces
mkdir -p dirPilot/serverSide dirPilot/serverSide/main dirPilot/clientSide dirPilot/clientSide/main dirPilot/clientSide/entities \
         dirPilot/interfaces
cp serverSide/main/SimulPar.class dirPilot/serverSide/main
cp clientSide/main/ClientPilot.class dirPilot/clientSide/main
cp clientSide/entities/Pilot.class clientSide/entities/PilotStates.class dirPilot/clientSide/entities
cp interfaces/PlaneInterface.class interfaces/DepAirportInterface.class interfaces/DestAirportInterface.class interfaces/GeneralReposInterface.class dirPilot/interfaces

echo "  Hostess"
rm -rf dirHostess/serverSide dirHostess/clientSide dirHostess/interfaces
mkdir -p dirHostess/serverSide dirHostess/serverSide/main dirHostess/clientSide dirHostess/clientSide/main dirHostess/clientSide/entities \
         dirHostess/interfaces
cp serverSide/main/SimulPar.class dirHostess/serverSide/main
cp clientSide/main/ClientHostess.class dirHostess/clientSide/main
cp clientSide/entities/Hostess.class clientSide/entities/HostessStates.class dirHostess/clientSide/entities
cp interfaces/PlaneInterface.class interfaces/DepAirportInterface.class interfaces/GeneralReposInterface.class dirHostess/interfaces

echo "  Passengers"
rm -rf dirPassenger/serverSide dirPassenger/clientSide dirPassenger/interfaces
mkdir -p dirPassenger/serverSide dirPassenger/serverSide/main dirPassenger/clientSide dirPassenger/clientSide/main dirPassenger/clientSide/entities \
         dirPassenger/interfaces
cp serverSide/main/SimulPar.class dirPassenger/serverSide/main
cp clientSide/main/ClientPassenger.class dirPassenger/clientSide/main
cp clientSide/entities/Passenger.class clientSide/entities/PassengerStates.class dirPassenger/clientSide/entities
cp interfaces/PlaneInterface.class interfaces/DepAirportInterface.class interfaces/GeneralReposInterface.class dirPassenger/interfaces

echo "Compressing execution environments."
echo "  Register Remote Objects"
rm -f  dirRMIRegistry.zip
zip -rq dirRMIRegistry.zip dirRMIRegistry
rm -f  dirRegistry.zip
zip -rq dirRegistry.zip dirRegistry set_rmiregistry_alt.sh
echo "  General Repository of Information"
rm -f  dirGeneralRepos.zip
zip -rq dirGeneralRepos.zip dirGeneralRepos
echo "  Departure Airport"
rm -f  dirDepAirport.zip
zip -rq dirDepAirport.zip dirDepAirport
echo "  Plane"
rm -f  dirPlane.zip
zip -rq dirPlane.zip dirPlane
echo "  Destination Airport"
rm -f  dirDestAirport.zip
zip -rq dirDestAirport.zip dirDestAirport

echo "  Pilot"
rm -f  dirPilot.zip
zip -rq dirPilot.zip dirPilot
echo "  Hostess"
rm -f  dirHostess.zip
zip -rq dirHostess.zip dirHostess
echo "  Passenger"
rm -f  dirPassenger.zip
zip -rq dirPassenger.zip dirPassenger

echo "Deploying and decompressing execution environments."
mkdir -p test/Airlift
rm -rf test/Airlift/*
cp dirRegistry.zip test/Airlift
cp dirGeneralRepos.zip test/Airlift
cp dirDepAirport.zip test/Airlift
cp dirPlane.zip test/Airlift
cp dirDestAirport.zip test/Airlift
cp dirPilot.zip test/Airlift
cp dirHostess.zip test/Airlift
cp dirPassenger.zip test/Airlift
cd test/Airlift
unzip -q dirRegistry.zip
unzip -q dirGeneralRepos.zip
unzip -q dirDepAirport.zip
unzip -q dirPlane.zip
unzip -q dirDestAirport.zip
unzip -q dirPilot.zip
unzip -q dirHostess.zip
unzip -q dirPassenger.zip

xterm  -T "General Repository" -hold -e "./GeneralReposDeployAndRun.sh" &
sleep 10
xterm  -T "DepartureAirport" -hold -e "./DepartureAirportDeployAndRun.sh" &
xterm  -T "Plane" -hold -e "./PlaneDeployAndRun.sh" &
sleep 10
xterm  -T "DestinationAirport" -hold -e "./DestinationAirportDeployAndRun.sh" &
sleep 5
xterm  -T "Pilot" -hold -e "./PilotDeployAndRun.sh" &
xterm  -T "Hostess" -hold -e "./HostessDeployAndRun.sh" &
sleep 3
xterm  -T "Passenger" -hold -e "./PassengerDeployAndRun.sh" &

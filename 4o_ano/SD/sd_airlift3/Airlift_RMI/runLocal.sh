path="filipe/Desktop/4_ano/SD/git"
cd dirRMIRegistry/
gnome-terminal --tab -- sh -c "./set_rmiregistry_com_alt.sh $path; bash"
cd ../dirRegistry
gnome-terminal --tab -- sh -c "./registry_com_alt.sh $path; bash"
cd ../dirGeneralRepos
gnome-terminal --tab -- sh -c "./repos_com_alt.sh $path; bash"
cd ../dirDepAirport
gnome-terminal --tab -- sh -c "./depairport_com_alt.sh $path; bash"
cd ../dirPlane
gnome-terminal --tab -- sh -c "./plane_com_alt.sh $path; bash"
cd ../dirDestAirport
gnome-terminal --tab -- sh -c "./destairport_com_alt.sh $path; bash"
cd ../dirPilot
gnome-terminal --tab -- sh -c "./pilot_com_alt.sh $path; bash"
cd ../dirHostess
gnome-terminal --tab -- sh -c "./hostess_com_alt.sh $path; bash"
cd ../dirPassenger
gnome-terminal --tab -- sh -c "./passenger_com_alt.sh $path; bash"


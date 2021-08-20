echo "Transfering data to the departure airport node."
sshpass -f password ssh sd307@l040101-ws10.ua.pt 'mkdir -p ~/departureair'
sshpass -f password ssh sd307@l040101-ws10.ua.pt 'rm -rf ~/departureair/*'
sshpass -f password scp dirDepAirport.zip sd307@l040101-ws10.ua.pt:~/departureair/
echo "Decompressing data sent to the departure airport node."
sshpass -f password ssh sd307@l040101-ws10.ua.pt 'cd ~/departureair/ ; unzip -uq dirDepAirport.zip'
echo "Executing program at the departure airport node."
sshpass -f password ssh sd307@l040101-ws10.ua.pt 'cd ~/departureair/dirDepAirport ; ./depair_com.sh sd307 22360 l040101-ws05.ua.pt 22364'

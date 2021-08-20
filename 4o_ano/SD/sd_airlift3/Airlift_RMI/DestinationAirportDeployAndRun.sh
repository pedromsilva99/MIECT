echo "Transfering data to the destination airport node."
sshpass -f password ssh sd307@l040101-ws03.ua.pt 'mkdir -p ~/destinationair'
sshpass -f password ssh sd307@l040101-ws03.ua.pt 'rm -rf ~/destinationair/*'
sshpass -f password scp dirDestAirport.zip sd307@l040101-ws03.ua.pt:~/destinationair/
echo "Decompressing data sent to the destination airport node."
sshpass -f password ssh sd307@l040101-ws03.ua.pt 'cd ~/destinationair/ ; unzip -uq dirDestAirport.zip'
echo "Executing program at the destination airport node."
sshpass -f password ssh sd307@l040101-ws03.ua.pt 'cd ~/destinationair/dirDestAirport ; ./desair_com.sh sd307 22361 l040101-ws05.ua.pt 22364'

echo "Transfering data to the passenger node."
sshpass -f password ssh sd307@l040101-ws09.ua.pt 'mkdir -p ~/passenger'
sshpass -f password ssh sd307@l040101-ws09.ua.pt 'rm -rf ~/passenger/*'
sshpass -f password scp dirPassenger.zip sd307@l040101-ws09.ua.pt:~/passenger/
echo "Decompressing data sent to the passenger node."
sshpass -f password ssh sd307@l040101-ws09.ua.pt 'cd ~/passenger/ ; unzip -uq dirPassenger.zip'
echo "Executing program at the passenger node."
sshpass -f password ssh sd307@l040101-ws09.ua.pt 'cd ~/passenger/dirPassenger ; ./passenger_com.sh l040101-ws05.ua.pt 22364'

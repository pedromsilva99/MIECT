echo "Transfering data to the pilot node."
sshpass -f password ssh sd307@l040101-ws07.ua.pt 'mkdir -p ~/pilot'
sshpass -f password ssh sd307@l040101-ws07.ua.pt 'rm -rf ~/pilot/*'
sshpass -f password scp dirPilot.zip sd307@l040101-ws07.ua.pt:~/pilot/
echo "Decompressing data sent to the pilot node."
sshpass -f password ssh sd307@l040101-ws07.ua.pt 'cd ~/pilot/ ; unzip -uq dirPilot.zip'
echo "Executing program at the pilot node."
sshpass -f password ssh sd307@l040101-ws07.ua.pt 'cd ~/pilot/dirPilot ; ./pilot_com.sh l040101-ws05.ua.pt 22364'

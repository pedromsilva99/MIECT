echo "Transfering data to the hostess node."
sshpass -f password ssh sd307@l040101-ws08.ua.pt 'mkdir -p ~/hostess'
sshpass -f password ssh sd307@l040101-ws08.ua.pt 'rm -rf ~/hostess/*'
sshpass -f password scp dirHostess.zip sd307@l040101-ws08.ua.pt:~/hostess/
echo "Decompressing data sent to the hostess node."
sshpass -f password ssh sd307@l040101-ws08.ua.pt 'cd ~/hostess/ ; unzip -uq dirHostess.zip'
echo "Executing program at the hostess node."
sshpass -f password ssh sd307@l040101-ws08.ua.pt 'cd ~/hostess/dirHostess ; ./hostess_com.sh l040101-ws05.ua.pt 22364'

echo "Transfering data to the registry node."
sshpass -f password ssh sd307@l040101-ws05.ua.pt 'mkdir -p ~/registry'
sshpass -f password ssh sd307@l040101-ws05.ua.pt 'rm -rf ~/registry/*'
sshpass -f password scp dirRegistry.zip sd307@l040101-ws05.ua.pt:~/registry/
echo "Decompressing data sent to the registry node."
sshpass -f password ssh sd307@l040101-ws05.ua.pt 'cd ~/registry ; unzip -uq dirRegistry.zip'
echo "Executing program at the registry node."
sshpass -f password ssh sd307@l040101-ws05.ua.pt 'cd ~/registry/dirRegistry ; ./registry_com.sh sd307 22365 l040101-ws05.ua.pt 22364'

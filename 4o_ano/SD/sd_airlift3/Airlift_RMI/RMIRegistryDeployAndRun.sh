echo "Transfering data to the RMIregistry node."
sshpass -f password ssh sd307@l040101-ws05.ua.pt 'mkdir -p ~/rmiregistry'
sshpass -f password ssh sd307@l040101-ws05.ua.pt 'rm -rf ~/rmiregistry/*'
sshpass -f password ssh sd307@l040101-ws05.ua.pt 'mkdir -p ~/Public/classes/interfaces'
sshpass -f password ssh sd307@l040101-ws05.ua.pt 'rm -rf ~/Public/classes/interfaces/*'
sshpass -f password scp dirRMIRegistry.zip sd307@l040101-ws05.ua.pt:~/rmiregistry
echo "Decompressing data sent to the RMIregistry node."
sshpass -f password ssh sd307@l040101-ws05.ua.pt 'cd ~/rmiregistry ; unzip -uq dirRMIRegistry.zip'
sshpass -f password ssh sd307@l040101-ws05.ua.pt 'cd ~/rmiregistry/dirRMIRegistry ; cp interfaces/*.class ~/Public/classes/interfaces ; cp set_rmiregistry.sh ~'
echo "Executing program at the RMIregistry node."
sshpass -f password ssh sd307@l040101-ws05.ua.pt 'cd ~; ./set_rmiregistry.sh sd307 22364'

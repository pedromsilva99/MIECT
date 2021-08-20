echo "Transfering data to the plane node."
sshpass -f password ssh sd307@l040101-ws02.ua.pt 'mkdir -p ~/plane'
sshpass -f password ssh sd307@l040101-ws02.ua.pt 'rm -rf ~/plane/*'
sshpass -f password scp dirPlane.zip sd307@l040101-ws02.ua.pt:~/plane/
echo "Decompressing data sent to the plane node."
sshpass -f password ssh sd307@l040101-ws02.ua.pt 'cd ~/plane/ ; unzip -uq dirPlane.zip'
echo "Executing program at the plane node."
sshpass -f password ssh sd307@l040101-ws02.ua.pt 'cd ~/plane/dirPlane ; ./plane_com.sh sd307 22361 l040101-ws05.ua.pt 22364'

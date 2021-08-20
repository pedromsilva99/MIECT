echo "Transfering data to the general repos node."
sshpass -f password ssh sd307@l040101-ws04.ua.pt 'mkdir -p ~/generalrepos'
sshpass -f password ssh sd307@l040101-ws04.ua.pt 'rm -rf ~/generalrepos/*'
sshpass -f password scp dirGeneralRepos.zip sd307@l040101-ws04.ua.pt:~/generalrepos/
echo "Decompressing data sent to the general repos node."
sshpass -f password ssh sd307@l040101-ws04.ua.pt 'cd ~/generalrepos/ ; unzip -uq dirGeneralRepos.zip'
echo "Executing program at the plane node."
sshpass -f password ssh sd307@l040101-ws04.ua.pt 'cd ~/generalrepos/dirGeneralRepos ; ./repos_com.sh sd307 22363 l040101-ws05.ua.pt 22364'

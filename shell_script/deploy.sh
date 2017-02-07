#!/usr/bin/env bash

echo "deploy start"
echo "Project Name : kunwoo-kim-aka"

#SCP : File Transfer
while read ssh_user ssh_ip;
do
    echo "scp($(dirname "$PWD") to ${ssh_user}@${ssh_ip}:/home1/${ssh_user}"
    scp -prq $(dirname "$PWD") "${ssh_user}@${ssh_ip}:/home1/${ssh_user}" &
done < server_list


#SSH : Change the IP of Database
while read ssh_user ssh_ip;
do
    echo "ssh to ${ssh_user}@${ssh_ip}:/home1/${ssh_user}"
    ssh "${ssh_user}@${ssh_ip}" sh < ssh_change_ip.sh
done < server_list

echo "deploy end"
exit 0
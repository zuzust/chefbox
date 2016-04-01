#!/usr/bin/env bash


usr=$(whoami)


echo
echo "Limpiando el entorno..."
echo

sudo apt-get -y purge ssmtp mutt openssh-server

sudo rm -f /etc/sudoers.d/10_${usr}
find $HOME -maxdepth 1 -name dead.letter -delete
rm -f ${HOME}/.muttrc
rm -f ${HOME}/.ssh/authorized_keys
rm -f ${HOME}/.bash_history

sudo rm -f /etc/chef/edb
sudo rm -f /opt/chef/embedded/ssl/certs/ocserver.pem
sudo rm -rf /var/chef/
sudo apt-get -y purge chef

sudo apt-get -y autoremove

echo
echo "La limpieza ha finalizado. Cierra la sesión e inicia una nueva"
echo "para empezar a usar tu nuevo entorno."
echo

sleep 3

pamac install xclip --no-confirm
pamac install vim --no-confirm
pamac install terminator --no-confirm
pamac install make --no-confirm


echo Installing Granted

curl -OL releases.commonfate.io/granted/v0.11.1/granted_0.11.1_linux_x86_64.tar.gz
sudo tar -zxvf ./granted_0.11.1_linux_x86_64.tar.gz -C /usr/local/bin/

rm granted_0.11.1_linux_x86_64.tar.gz



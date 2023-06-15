pamac install xclip --no-confirm
pamac install vim --no-confirm
pamac install terminator --no-confirm
pamac install make --no-confirm
pamac install patch --no-confirm
pamac install fd --no-confirm
pamac install vscode --no-confirm
pamac install nvm --no-confirm
pamac install unzip --no-config
pamac install caffeine-ng --no-config

echo Installing aws-cli

if ! command -v aws &>/dev/null; then
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
fi

if ! command -v granted &>/dev/null; then
	echo Installing Granted
	curl -OL releases.commonfate.io/granted/v0.11.1/granted_0.11.1_linux_x86_64.tar.gz
	sudo tar -zxvf ./granted_0.11.1_linux_x86_64.tar.gz -C /usr/local/bin/
	rm granted_0.11.1_linux_x86_64.tar.gz
	echo ***********DONE*************
fi

if ! command -v spack &>/dev/null; then
	echo Installing Spack
	git clone -c feature.manyFiles=true https://github.com/spack/spack.git
	./bin/spack install zlib
	sudo ./share/spack/setup-env.sh
	echo ***********DONE*************
fi

if ! command -v gh &>/dev/null; then
	echo Installing GH client
	spack uninstall gh && spack install gh
	echo ***********DONE*************
fi

echo Installing go
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz
echo Done

echo Download MIRO
sudo snap install miro
echo done

echo Download sublime-text
sudo snap install sublime-text --classic
echo done

echo Download rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo done

echo Download rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo done

echo Download postgres
sudo pacman -S postgresql
echo done


echo Download pipewire
pamac install manjaro-pipewire
echo done

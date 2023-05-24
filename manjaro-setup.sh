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

if ! command -v aws &> /dev/null
then
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
fi

if ! command -v granted &> /dev/null
then
	echo Installing Granted
	curl -OL releases.commonfate.io/granted/v0.11.1/granted_0.11.1_linux_x86_64.tar.gz
	sudo tar -zxvf ./granted_0.11.1_linux_x86_64.tar.gz -C /usr/local/bin/
	rm granted_0.11.1_linux_x86_64.tar.gz
	echo ***********DONE*************
fi

if ! command -v spack &> /dev/null
then
	echo Installing Spack
	git clone -c feature.manyFiles=true https://github.com/spack/spack.git
	./bin/spack install zlib
	sudo ./share/spack/setup-env.sh
	echo ***********DONE*************
fi


if ! command -v gh &> /dev/null
then
	echo Installing GH client
	spack uninstall gh && spack install gh
	echo ***********DONE************* 
fi

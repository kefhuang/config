sudo apt install -y vim \
	ca-certificates \
	curl \
	gnupg \
	wget \
	git \
	zsh

# Install Docker
echo "----------------------------------------"
echo "Installing Docker"
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
if ! getent group docker > /dev/null; then
	sudo groupadd docker
fi
sudo usermod -aG docker $USER
echo "----------------------------------------"
echo "Docker has been installed. You may need to logout to enable rootless docker."
echo "----------------------------------------"

# Install Nvidia Container Toolkit
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
nvidia-ctk runtime configure --runtime=docker --config=$HOME/.config/docker/daemon.json
sudo nvidia-ctk config --set nvidia-container-cli.no-cgroups --in-place
echo "----------------------------------------"
echo "Nvidia Container Toolkit has been installed."
echo "----------------------------------------"

# Git config
git config --global user.name "kefhuang"
git config --global user.email "aqr.kefhuang@gmail.com"
git config --global core.editor vim

# Install oh-my-zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install theme fonts
wget -O "$HOME/Downloads/MesloLGS NF Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -O "$HOME/Downloads/MesloLGS NF Bold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -O "$HOME/Downloads/MesloLGS NF Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -O "$HOME/Downloads/MesloLGS NF Bold Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
sudo mkdir -p /usr/share/fonts/truetype/MesloLGS
sudo mv *.ttf /usr/share/fonts/truetype/MesloLGS/.
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "----------------------------------------"
echo "oh-my-zsh has been installed."
echo "----------------------------------------"

# Load Configurations
if [ -f "$HOME/.zshrc" ]; then
	rm "$HOME/.zshrc"
fi
ln -s `pwd`/configs/zshrc $HOME/.zshrc
ln -s `pwd`/configs/zshrc.common $HOME/.zshrc.common
ln -s `pwd`/configs/p10k.zsh $HOME/.p10k.zsh
ln -s `pwd`/configs/vimrc $HOME/.vimrc




cwd=$(pwd)

# apt source to tsinghua
sudo rm /etc/apt/sources.list
sudo ln -s $cwd/configs/cn/sources.list.cn /etc/apt/sources.list

sudo apt update
sudo apt upgrade

# install clash
sudo cp $cwd/configs/cn/clash /usr/local/bin/clash
sudo chmod +x /usr/local/bin/clash
sudo chown root:root /usr/local/bin/clash
sudo cp $cwd/configs/cn/clash.service /etc/systemd/system/clash.service
if [ ! -d "/.config/clash" ]; then
    mkdir -p /.config/clash
fi
sudo ln -s $cwd/configs/cn/config.yaml /.config/clash/config.yaml
sudo cp $cwd/configs/cn/Country.mmdb /.config/clash/Country.mmdb
sudo systemctl daemon-reload
sudo systemctl enable clash
sudo systemctl start clash


# TODO Maybe change local bashrc / zshrc only
# TODO Maybe change the system proxy

# TODO Docker mirror
sudo vim /etc/docker/daemon.json
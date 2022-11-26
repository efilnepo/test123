#!/bin/bash
pushd `mktemp -d`
sudo apt-get install -y zsh pip git jq postgresql-client net-tools tree
pip install ansible==4.5.0

curl -fsSL https://get.docker.com | sh -
sudo usermod -aG docker vagrant
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.22.1/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
curl -L https://git.io/get_helm.sh | bash

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

sudo wget https://github.com/mikefarah/yq/releases/download/v4.2.0/yq_linux_amd64 -O /usr/bin/yq &&\
    sudo chmod +x /usr/bin/yq

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
echo "exec zsh" >> ~/.bashrc

source ~/.bashrc

cd ~
mkdir bin

echo 'export PATH=$PATH:~/bin' >> ~/.zshrc
echo 'export PATH=$PATH:~/.local/bin' >> ~/.zshrc
echo 'alias k=kubectl' >> ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin

sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' .zshrc

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

yes| ~/.fzf/install

sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

popd



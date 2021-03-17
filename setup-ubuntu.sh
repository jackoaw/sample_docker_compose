# Update Package Manager Lists
sudo apt-get update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
# Install all the needed Docker Components
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    docker-compose
sudo apt install -y docker-ce docker-ce-cli containerd.io

sleep 5
# Create the docker group and add your user to it
# The purpose is to allow your non-root user to use docker freely
sudo groupadd docker
sudo usermod -aG docker $USER
# Have docker startup on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sleep 10

# Install git, may not be needed, since you probably cloned this repo
sudo apt-get install -y git

# Install Python
sudo apt-get install -y python3

# Build and run docker images
docker-compose build
docker-compose up

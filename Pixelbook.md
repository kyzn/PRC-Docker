# Installing Docker on Pixelbook Debian:

sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update

# This will throw "starting container process caused" issues. Build your own runC to get around.
# https://www.reddit.com/r/Crostini/comments/9jabhq/docker_now_working/

sudo apt install golang libseccomp-dev
export GOPATH=~/go
go get github.com/opencontainers/runc
cd ~/go/src/github.com/opencontainers/runc
make
sudo cp runc /usr/local/bin/runc-chromeos
echo '
{
  "runtimes": {
    "runc-chromeos": {
      "path": "/usr/local/bin/runc-chromeos"
    }
  },
  "default-runtime": "runc-chromeos"
} ' > /etc/docker/daemon.json
sudo service docker restart
sudo docker info | grep "Default Runtime: runc-chromeos"

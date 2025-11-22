#To manage mutiple environmental variables

sudo apt-get install direnv

vim ~/.bashrc 
eval "$(direnv hook bash)"
:wq
source ~/.bashrc

mkdir project-01
mkdir project-02

cd project-01 
vim .envrc
(paste the env variables here)
export AWS_SECRET_ACCESS_KEY=123456789
:wq

direnv allow .

cd project-01 
env or echo $AWS_SECRET_ACCESS_KEY



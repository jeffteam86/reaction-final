FROM reactioncommerce/reaction

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install curl sudo git nano -y

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

RUN apt-get install -y nodejs

RUN apt-get install gcc g++ make -y

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt-get install yarn

curl https://install.meteor.com/ | sh

RUN npm install -g reaction-cli

RUN su node

RUN mkdir /home/node/reaction-project 

WORKDIR /home/node/reaction-project

RUN reaction init

WORKDIR reaction

RUN reaction

EXPOSE "80:3000"




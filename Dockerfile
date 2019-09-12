FROM reactioncommerce/reaction

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install curl sudo git nano -y

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

RUN apt-get install -y nodejs

RUN apt-get install gcc g++ make -y

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN sudo apt-get update && sudo apt-get install yarn

RUN curl https://install.meteor.com/ | sh

RUN npm install -g reaction-cli

RUN USER node 

RUN mkdir /home/$USER/reaction-project  

WORKDIR /home/$USER/reaction-project

RUN reaction init

WORKDIR home/$USER/reaction-project/reaction

RUN reaction

EXPOSE "80:3000"




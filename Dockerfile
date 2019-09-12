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

RUN echo "node ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user &&  chmod 0440 /etc/sudoers.d/user

#RUN USER node 

#RUN su - node -c "mkdir /home/node/reaction-project && cd /home/node/reaction-project"

RUN su - node -c "reaction init"

RUN su - node -c "sed -i -e 's/3000:3000/80:3000/g' reaction/docker-compose.yml"

RUN su - node -c "cd reaction && reaction &"

EXPOSE "80:3000"

CMD ["su", "-", "node", "-c", "/bin/bash"]




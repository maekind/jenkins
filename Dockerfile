# Jenkins image
FROM jenkins/jenkins:lts-jdk11
LABEL maekind.webplayer.name="jenkins" \
      maekind.webplayer.maintainer="Marco Espinosa" \
      maekind.webplayer.version="1.0" \
      maekind.webplayer.description="Jenkins image for CI/CD" \
      maekind.webplayer.email="hi@marcoespinosa.es"

USER root
# Install  programs
RUN apt update && apt install -y \ 
      pylint3 \
      gcc \ 
      python3-dev \ 
      python3-pip \
      curl \  
      && apt autoremove \
      && rm -Rf /var/cache/apt/* \
      && rm -Rf /var/lib/apt/lists/*  

# Change working dir to app and copy requirements
WORKDIR /app
COPY requirements.txt requirements.txt

# Install requirements
RUN pip3 install -r requirements.txt --no-cache-dir

# Install nodejs and angular cli
COPY node-v14.17.0-linux-x64.tar.xz node-v14.17.0-linux-x64.tar.xz

RUN mkdir -p /usr/local/lib/nodejs \ 
      && tar -xJvf node-v14.17.0-linux-x64.tar.xz -C /usr/local/lib/nodejs \
      && ln -s /usr/local/lib/nodejs/node-v14.17.0-linux-x64/bin/node /usr/bin/node \
      && ln -s /usr/local/lib/nodejs/node-v14.17.0-linux-x64/bin/npm /usr/local/bin/npm \ 
      && npm install -g npm \
      && npm version \
      && npm install -g @angular/cli \
      && npm link @angular/cli \ 
      && ln -s /usr/local/lib/nodejs/node-v14.17.0-linux-x64/lib/node_modules/@angular/cli/bin/ng  /usr/local/bin/ng \
      && ng version \ 
      && rm -f node-v14.17.0-linux-x64.tar.xz \
      && rm -Rf node_modules \  
      && rm requirements.txt

USER jenkins

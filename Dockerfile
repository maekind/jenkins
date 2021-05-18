# Jenkins image
FROM jenkins/jenkins:lts-jdk11
LABEL maekind.webplayer.name="jenkins" \
      maekind.webplayer.maintainer="Marco Espinosa" \
      maekind.webplayer.version="1.0" \
      maekind.webplayer.description="Jenkins image for CI/CD" \
      maekind.webplayer.email="hi@marcoespinosa.es"

USER root
# Install  programs
RUN apt update && apt install -y pylint3

USER jenkins

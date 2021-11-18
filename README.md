# Jenkins Docker image

This image has the following functions:
- Pylint checker for verifying python style files and error.
- Node.js 14.17, angular CLI 13.0.3 and npm 8.1.3 to build angular projects.

# Samples

- docker-compose-sample.yaml file: This is sample that maps jenkins data folder (/var/jenkins_home)
to an external NFS folder. In my case, placed into a NAS. In order to have this sample running,
you have to replace variables $FQDN with your NAS ip or fqdn and $YOUR_PATH with the data folder. 
s

## Credits

2021 Copyright to Marco Espinosa. 

Say hello!: [hi@marcoespinosa.es](mailto:hi@marcoespinosa.es)

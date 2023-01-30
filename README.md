# Jenkins Docker image

This image has the following functions:
- Pylint checker for verifying python style files and error.
- Node.js, angular CLI and npm to build angular projects.

# Samples

- docker-compose-sample.yaml file: This is a sample that maps jenkins data folder (/var/jenkins_home)
to an external NFS folder. In my case, placed into a NAS. In order to have this sample running,
you have to replace variables $FQDN with your NAS ip or fqdn address and $YOUR_PATH with the data folder. 

## Credits

2021-2023 Copyright to Marco Espinosa. 

Say hello!: [hi@marcoespinosa.es](mailto:hi@marcoespinosa.es)

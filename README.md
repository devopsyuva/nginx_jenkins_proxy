1) Nginx as proxy to access Jenkins server container listening on domain http://jekinsmainserver:8080
2) Create jenkins containers with command mentioned below, hostname can be modified but ensure that u have
   updated in nginx/default.conf file and pass the same name while creating nginx container with --link
   option:
   > docker container run -d --name jenkinsmainserver sudhams483/jenkins_custom_yaml:2.289.1
3) Now, lets initiate Nginx as proxy to access jenkins containers:
   > docker container run -d --name nginxserver --link jenkinsmainserver:jenkinsmainserver -p443:443 sudhams483/nginx_jenkins_proxy:latest

.
├── jenkins
│   └── jenkins
│       ├── Dockerfile
│       ├── plugins.txt
│       └── src
│           └── jenkins.yaml
├── nginx_proxy
│   ├── default.conf
│   ├── Dockerfile
│   └── src
│       └── certs
│           ├── nginx-crt.pem
│           └── nginx.pem
└── README.md

6 directories, 8 files

Note: check nginx and jenkins directory to build custom images and save in the repository.
Nginx image: sudhams483/nginx_jenkins_proxy:latest
Jenkins Image: sudhams483/jenkins_custom_yaml:2.289.1  

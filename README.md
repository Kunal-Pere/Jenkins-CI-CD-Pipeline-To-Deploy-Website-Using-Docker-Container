# Jenkins-CI-CD-Pipeline-To-Deploy-Website-Using-Docker-Container

### Overview :

This repository contains the necessary files to set up a CI/CD pipeline using Jenkins for deploying a website inside a Docker container. The website files are sourced from FreeCSS, and the pipeline ensures continuous integration and continuous deployment.

### Prerequisites :

* Jenkins server installed and configured
* Docker installed on the Jenkins server
* Git repository with website files and configuration files (Dockerfile and Jenkinsfile)

### Repository Structure :

  .
  
  ├── CSS/
  
  ├── images/
  
  ├── js/
  
  ├── Dockerfile
  
  ├── Jenkinsfile
  
  ├── README.md
  
  ├── about.html
  
  ├── contact.html
  
  ├── gallery.html
  
  ├── index.html
  
  └── services.html

### Dockerfile :

The Dockerfile contains instructions to build a Docker image for the website.

    FROM ubuntu

    RUN apt-get update

    RUN apt-get -y install apache2

    ADD .  /var/www/html

    ENTRYPOINT apachectl -D FOREGROUND


### Jenkinsfile :

The Jenkinsfile defines the CI/CD pipeline for building and deploying the Docker container.


    pipeline{
    agent{
        label "slave"
    }
    stages{
        stage("cloning"){
            steps{
                echo"cloning repo to the server"
                git url:"https://github.com/Kunal-Pere/Jenkins-CI-CD-Pipeline-To-Deploy-Website-Using-Docker-Container.git", branch:"main"
            }
        }
        stage("Building image"){
            steps{
                echo"Building image through Dockerfile"
                sh "sudo chmod 777 /var/run/docker.sock"
                sh "docker build -t kunal1010/coffeeshop ."
            }
        }
        stage("pushing on dockerhub"){
            steps{
                echo"pushing this image on dockerhub"
                withCredentials([usernamePassword(credentialsId:"dockerhub", usernameVariable:"dockeruser", passwordVariable:"dockerpass")]){
                    sh "docker login -u ${env.dockeruser} -p ${env.dockerpass}"
                    sh "docker push kunal1010/coffeeshop"
                }
            }
        }
        stage("Running container"){
            steps{
                echo"running coffeeshop on container"
                sh "docker run -itd -p 82:80 kunal1010/coffeeshop"
              }
            }
          }
        } 


### Setting Up Jenkins Pipeline :

  * Open Jenkins and create a new pipeline project.
  * In the pipeline configuration, set the pipeline definition to "Pipeline script from SCM".
  * Select "Git" and provide the repository URL.
  * Specify the branch to build (e.g., main).
  * Save the configuration and run the pipeline.

### Testing the Deployment :

Access the deployed website by navigating to http://your-server-ip:82 in your web browser.


### Regards,

### Kunal Pere

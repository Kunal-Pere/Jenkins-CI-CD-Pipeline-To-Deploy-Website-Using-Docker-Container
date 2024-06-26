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

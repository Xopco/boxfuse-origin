pipeline {
  agent {

    docker {
      image 'nexus:8123/jenkins-agent'
    }
  }

  stages {

    stage ('Copy source') {
      steps {
        git 'https://github.com/Xopco/boxfuse-origin.git'
      }
    }

    stage ('Build war') {
      steps {
        sh 'mvn package'
      }
    }

    stage  ('Make docker image') {
      steps {
        sh 'docker build --tag=mywebapp2 .'
        sh '''docker tag mywebapp2 nexus:8123/mywebapp2 && docker push nexus:8123/mywebapp2'''
      }
    }

    stage ('Run docker on v2') {
      steps {
	docker pull nexus:8123/mywebapp2
	docker run -d mywebapp2
      }
    }
  }
}
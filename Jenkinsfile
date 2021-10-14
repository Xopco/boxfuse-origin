pipeline {
  agent {

    docker {
      image 'nexus:8123/mywebapp2/jenkins-agent'
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

    stage ('Deploy') {
      steps {
        deploy adapters: [tomcat9(credentialsId: '94cca051-75ae-478f-8b03-f63d40e22661', path: '', url: 'http://34.88.136.33:8080')], contextPath: 'mywebapp2', war: '**/*.war'
      }
    }

    stage  ('Make docker image') {
      steps {
        sh 'cp boxfuse-sample-java-war-hello/target/hello-1.0.war var/lib/tomcat9/mywebapp2 && cd var/lib/tomcat9/mywebapp2 && docker build --tag=mywebapp2 .'
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
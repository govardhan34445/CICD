pipeline{
  agent any 
  
  stages{
    stage('Build Maven Package'){
      steps{
        script{
          sh """
          ls -al
          mvn clean package
          """
        }
      }
    }
    stage('SonarQube Analysis') {
      steps {
        steps{
           withSonarQubeEnv(sonarqube) {
              sh "mvn clean verify sonar:sonar -Dsonar.projectKey=java-web-app"
           }
        }
    }
  }
    stage("Build Docker image"){
      steps{
        script{
          sh """
          docker build -t cicd:${BUILD_NUMBER} .
          """
        }
      }
    }
    stage("Create a container"){
      steps{
        script{
          sh """
          docker run -d -p 9090:8080 --name appcontainer cicd:${BUILD_NUMBER}
          """
        }
      }
    }
  }
}

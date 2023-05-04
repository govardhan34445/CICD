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
        environment {
        scannerHome = tool 'sonarqube'
       }
      steps {
        script{
           withSonarQubeEnv('sonarqube') {
              sh "mvn clean verify sonar:sonar -Dsonar.projectKey=java-web-app -Dsonar.login=admin -Dsonar.password=Govardhan"
           }
        }
    }
  }
    stage("Build Docker image"){
      steps{
        script{
          sh """
          docker build -t govardhandevops/gitlabwebapp::${BUILD_NUMBER} .
          """
        }
      }
    }
    stage("Push Docker Image"){
      steps{
        script{
          sh """
          docker push govardhandevops/gitlabwebapp::${BUILD_NUMBER}
          """
        }
      }
    }
  }
}

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
    stage("Build Docker image"){
      steps{
        script{
          sh """
          docker build -t cicd:${BUILD_NUMBER} .
          """
        }
      }
    }
  }
}

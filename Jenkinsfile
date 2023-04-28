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
  }
}

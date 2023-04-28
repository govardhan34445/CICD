pipeline{
  agent any 
  
  stages{
    stage('Check Syntax'){
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

pipeline {
  environment {
    registry = "jakkrit0660/jackjenline"
    registryCredential = 'DockerHubJack'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git'){
      steps{
        script{
	  git 'https://github.com/jakkrit0660/JackJenLine.git'
        }
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Pushing Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}

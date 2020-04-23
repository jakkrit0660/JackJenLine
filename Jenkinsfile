pipeline {
  environment {
    registry = "jakkrit0660/jackjenline"
    registryCredential = 'DockerHubJack'
    dockerImage = ''
    PROJECT_ID = 'AppModernize'
    CLUSTER_NAME = 'jenkinstesting'
    LOCATION = 'asia-southeast1-a'
    CREDENTIALS_ID = 'JackGKE'
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
    stage('Deploy to GKE') {
        steps{
            step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'Testdeployment.yml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
        }
    }
  }
}

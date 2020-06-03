node {

    stage('Clone repository') {
    git 'https://github.com/khallouli-dorra/ProjetFreedomtravel.git'
    
    }
    
    stage('Build and Push image') {
        withCredentials([usernamePassword(credentialsId: 'gitlab_registry', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) 
        {
        sh """
        docker login -u="$USERNAME" -p="$PASSWORD" registry.gitlab.com
        echo "Building version v1.0.${env.BUILD_NUMBER}"
        docker build -t registry.gitlab.com/dora-doudou/freedomtravel/freedomtravel:v1.1.${env.BUILD_NUMBER} .
        docker push registry.gitlab.com/dora-doudou/freedomtravel/freedomtravel:v1.1.${env.BUILD_NUMBER}
        
        docker build -t registry.gitlab.com/dora-doudou/freedomtravel/freedomtravel:latest .
        docker push registry.gitlab.com/dora-doudou/freedomtravel/freedomtravel:latest
        """
        }
       }
}

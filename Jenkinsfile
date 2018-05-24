pipeline {
    agent none

    environment {
        ICINGA_BUILD_TYPE = 'snapshot'
    }

    stages {
        stage('Build') {
            agent {
                docker { image 'registry.icinga.com/build-docker/debian/stretch:x86_64' }
            }
            steps {
                sh 'icinga-build-package'
            }
        }
        stage('Test') {
            agent {
                docker { image 'registry.icinga.com/build-docker/debian/stretch:x86_64' }
            }
            steps {
                sh 'find build/'
                sh 'icinga-build-test'
            }
        }
    }
}

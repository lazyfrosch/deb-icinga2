def targets = [ "debian/stretch", "ubuntu/xenial" ]

/*
def build_nodes = [:]

targets.each() {
    build_nodes[it] = {
        node(it) {
    }
}
*/

pipeline {
    agent none

    environment {
        ICINGA_BUILD_TYPE = 'snapshot'
    }

    stages {
        stage('Build') {
            parallel {
                stage("debian/jessie") {
                    agent {
                        docker { image "registry.icinga.com/build-docker/debian/jessie:x86_64" }
                    }
                    steps {
                        sh 'rm -rf build/; mkdir build; touch build/jessie; pwd; find build/'
                        //sh 'icinga-build-package'
                        //archive 'build/'
                    }
                }
                stage("debian/stretch") {
                    agent {
                        docker { image "registry.icinga.com/build-docker/debian/stretch:x86_64" }
                    }
                    steps {
                        sh 'rm -rf build/; mkdir build; touch build/stretch; pwd; find build/'
                        //sh 'icinga-build-package'
                        //archive 'build/'
                    }
                }
                stage("ubuntu/xenial") {
                    agent {
                        docker { image "registry.icinga.com/build-docker/ubuntu/xenial:x86_64" }
                    }
                    steps {
                        sh 'rm -rf build/; mkdir build; touch build/xenial; pwd; find build/'
                        //sh 'icinga-build-package'
                        //archive 'build/'
                    }
                }
            }
        }
        stage('Test') {
            parallel {
                stage("ubuntu/xenial") {
                    agent {
                        docker { image 'registry.icinga.com/build-docker/ubuntu/xenial:x86_64' }
                    }
                    steps {
                        sh 'find build/'
                        //sh 'icinga-build-test'
                    }
                }
                stage("debian/stretch") {
                    agent {
                        docker { image 'registry.icinga.com/build-docker/debian/stretch:x86_64' }
                    }
                    steps {
                        sh 'find build/'
                        //sh 'icinga-build-test'
                    }
                }
            }
        }
    }
}

// vi: filetype=groovy
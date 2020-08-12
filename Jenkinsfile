/*      Iterates over a list of available packages, creates dynamically named stages.     */


def list
pipeline {
    agent none
    stages {
        stage('Create List of Packages') {
            agent {node 'SparkZ-NP8-zLinux'}
            steps {
                script {
                    sh 'rm -rf repo'
                    sh "git clone https://github.com/Korpics/dockerfile-examples.git repo"
                    def iter = sh(script: "cd repo && ls -d */ ", returnStdout: true).toString().trim().toLowerCase()
                    l = iter.split('/').collect{it as String}
                    sh "echo '${l.size()}'"
                }
            }
        }
        stage('Dynamic Stages') {
            agent {node 'SparkZ-NP8-zLinux'}
            steps {
                script {
                    for(int i=0; i < l.size(); i++) {
                        stage(l[i]){
                            echo "Directory: $i"
                        }
                    }
                }
            }
            post {
                cleanup {
                    cleanWs()
                }
            }
        }
    }
}

pipeline {
    agent any
    tools {
        gradle "gradle6.8.2"
    }

    triggers {
        pollSCM '* * * * *'
    }

    stages {

        stage ('Clone') {
            steps {
                git branch: 'master', url: "https://github.com/Ankitp110/FirstWebAppJava.git"
            }
        }

        stage('Gradle') {
            steps {
                sh 'gradle --version'
            }
        }

        stage('build') {
            steps {
                sh 'gradle clean build'

            }
        }
   
        /* stage ('CopyArtifacts') {
            steps {
                sh 'scp FirtWebApp.war ankit@128.199.24.137:/var/lib/docker/volumes/jenkins-data/_data/workspace/FirstWebApp/build/libs ankit@128.199.24.137:/home/ankit/FirstWebApp'
            }

        } */
    }

}
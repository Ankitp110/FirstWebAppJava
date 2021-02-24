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
                sh 'gradle jar'

            }
        }

        stage('Building a Docker Image') {
            steps {
                sh 'gradle docker'

            }
        }

        stage ('DeployArtifacts') {
            steps {
                sh 'gradle artifactoryPublish'
            }

        } 
    }

}
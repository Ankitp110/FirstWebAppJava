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
                sh 'gradle build'

            }
        }

        stage('Building a Docker Image') {
            steps {
                sh 'cp /var/jenkins_home/workspace/FirstWebApp/build/libs/FirstWebApp.war /var/jenkins_home/workspace/FirstWebApp/FirstWebApp.war'
                sh 'gradle docker'
                sh 'rm -rf FirstWebApp.war'

            }
        }

        stage('Building a Docker Container') {
            steps {   
                sh 'gradle dockerRun'
            }
        }

        /* stage ('DeployArtifacts') {
            steps {
                sh 'gradle artifactoryPublish'
            }

        }  */
    }

}
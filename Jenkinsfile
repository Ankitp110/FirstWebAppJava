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
                sh 'gradle war'

            }
        }

        stage('Building a Docker Image') {
            steps {
                sh 'docker stop java-web-app-c'
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

        stage('Push Docker image') {
            environment {
                DOCKER_HUB_LOGIN = credentials('docker-hub')
            }
            steps {
                sh 'cp /var/jenkins_home/workspace/FirstWebApp/build/libs/FirstWebApp.war /var/jenkins_home/workspace/FirstWebApp/FirstWebApp.war'
                sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
                sh 'gradle dockerPush --stacktrace'
                sh 'rm -rf FirstWebApp.war'
            }
        }

        /* stage ('DeployArtifacts') {
            steps {
                sh 'gradle artifactoryPublish'
            }

        }  */
    }

}
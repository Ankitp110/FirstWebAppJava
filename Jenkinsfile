pipeline {
    agent any
    tools {
        gradle "gradle6.8.2"
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

        stage('deploying the file ') {
            steps {
                sh 'gradle deploy'

            }
        }
    }

}
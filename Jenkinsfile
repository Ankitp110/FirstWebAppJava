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

        stage ('Artifactory configuration') {
            steps {
                rtServer (
                    id: "ARTIFACTORY_SERVER",
                    url: "http://159.65.145:8081/artifactory",
                    credentialsId: 'bf4d6d00-015e-40de-8307-f50fd328760c'
                )

                rtGradleDeployer (
                    id: "GRADLE_DEPLOYER",
                    serverId: "ARTIFACTORY_SERVER",
                    repo: "libs-release-local",
                )

                rtGradleResolver (
                    id: "GRADLE_RESOLVER",
                    serverId: "ARTIFACTORY_SERVER",
                    repo: "jcenter"
                )
            }
        }

        stage ('Exec Gradle') {
            steps {
                rtGradleRun (
                    tool: "gradle6.8.2", // Tool name from Jenkins configuration
                    rootDir: "http://github.com/Ankitp110/FirstWebAppJava/blob/master",
                    buildFile: 'build.gradle',
                    tasks: 'clean artifactoryPublish',
                    deployerId: "GRADLE_DEPLOYER",
                    resolverId: "GRADLE_RESOLVER"
                )
            }
        
        }
        stage ('Publish build info') {
            steps {
                rtPublishBuildInfo (
                    serverId: "ARTIFACTORY_SERVER"
                )
            }
        }


   
        /* stage ('DeployArtifacts') {
            steps {
                sh 'gradle artifactoryPublish'
            }

        } */
    }

}
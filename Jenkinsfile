pipeline {
	agent { docker 'python:3.5.1' }
	environment { 
		CC = "${params.WORKFLOW}"
	}
	parameters {
		string(name: 'WORKFLOW', defaultValue: 'build-site', description: 'What workflow to run?')
	}
	stages {
		stage('build') {
			steps {
				sh 'echo $CC'
			}
		}
	}
}

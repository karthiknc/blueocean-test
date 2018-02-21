pipeline {
	agent {
		docker {
			image 'jfloff/alpine-python:3.4-slim'
		}
	}
	parameters {
		string(name: 'WORKFLOW', defaultValue: 'build-site', description: 'What workflow to run?')
	}
	environment { 
		WF = "${params.WORKFLOW}"
	}
	stages {
		stage('Prepare') {
			steps {
				sh '''
				pip install boto3
				mkdir ~/.aws
				touch ~/.aws/config
				echo '[default]' >> ~/.aws/config
				echo 'region = eu-west-1' >> ~/.aws/config
				echo 'output = json' >> ~/.aws/config
				'''
			}
		}
		stage('Build') {
			steps {
				sh 'python ./pipeline.py'
			}
		}
	}
}

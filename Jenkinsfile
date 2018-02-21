pipeline {
	agent {
		docker {
			image 'jfloff/alpine-python:3.4-slim'
		}
	}
	parameters {
		string(name: 'WORKFLOW', defaultValue: 'build-site', description: 'What workflow to run?')
		string(name: 'SITE', defaultValue: 'my-site', description: 'What site to build?')
		choice(name: 'TEST', choices:"Yes\nNo", description: "Do you wish to run tests?" )
		booleanParam(name: 'BOOL', defaultValue: true, description: 'Bool test')
	}
	environment { 
		WF = "${params.WORKFLOW}"
		SITE = "${params.SITE}"
		TEST = "${params.TEST}"
		BOOL = "${params.BOOL}"
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

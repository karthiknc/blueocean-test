pipeline {
	agent {
		docker {
			image 'jfloff/alpine-python:3.4'
		}
	}
	parameters {
		string(name: 'WORKFLOW', defaultValue: 'build-site', description: 'What workflow to run?')
	}
	environment { 
		WF = "${params.WORKFLOW}"
	}
	stages {
		stage('pre-build') {
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
		stage('build') {
			steps {
				sh 'pwd'
				sh 'ls -al'
				sh 'python ./pipeline.py'
				sh 'full="aws codebuild start-build --project-name nu-ecsplatform-orchestrator --environment-variables-override name=WORKFLOW,value=$WF" && echo $full'
			}
		}
	}
}

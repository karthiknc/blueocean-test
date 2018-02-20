pipeline {
	agent { docker 'python:3.6.1' }
	parameters {
		string(name: 'WORKFLOW', defaultValue: 'build-site', description: 'What workflow to run?')
	}
	environment { 
		WF = "${params.WORKFLOW}"
	}
	stages {
		stage('pre-build') {
			steps {
				sh 'whoami'
				sh 'ls -al'
				sh 'virtualenv venv && source venv/bin/activate && pip install boto3'
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

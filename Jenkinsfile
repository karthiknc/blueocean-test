pipeline {
	agent any
	parameters {
		string(name: 'WORKFLOW', defaultValue: 'build-site', description: 'What workflow to run?')
	}
	environment { 
		WF = "${params.WORKFLOW}"
	}
	stages {
		stage('pre-build') {
			steps {
				sh 'virtualenv venv && source venv/bin/activate'
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

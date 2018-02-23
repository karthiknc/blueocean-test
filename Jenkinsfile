pipeline {
	agent {
		docker {
			image 'jfloff/alpine-python:3.4-slim'
		}
	}
	parameters {
		choice(name: 'WORKFLOW', choices: 'build-site\ndeploy-site\nbuild-deploy-site', description: 'What workflow to run?')
		choice(name: 'BUILD_ENV', choices: 'dev\nuat\nstaging\nprod', description: 'Build environment:')
		string(name: 'BRANCH', defaultValue: 'master', description: 'Branch (Optional):')
		booleanParam(name: 'TEST', defaultValue: true, description: 'Do you wish to run tests?')
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

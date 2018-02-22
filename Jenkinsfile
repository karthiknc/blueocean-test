pipeline {
	agent {
		docker {
			image 'newsuk/ecs-agent:latest'
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
				cp ../../rsa_key ~/.ssh/id_rsa
				chmod 600 ~/.ssh/id_rsa
				git clone git@github.com:newsuk/nu-ecsplatform.git
				ls -al
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

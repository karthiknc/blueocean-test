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
				echo 'Prepare stage'
			}
		}
		stage('Build') {
			steps {
				sh 'ls -al'
				sh 'pwd'
				sh 'cat ./pipeline.py'
				sh 'python ./pipeline.py'
			}
		}
	}
}

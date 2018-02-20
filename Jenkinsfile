pipeline {
	agent { docker 'python:3.5.1' }
	parameters {
		string(name: 'WORKFLOW', defaultValue: 'build-site', description: 'What workflow to run?')
	}
	stages {
		stage('build') {
			steps {
				sh 'bash ./pipeline.sh'
				echo "Running ${params.WORKFLOW}"
			}
		}
	}
}

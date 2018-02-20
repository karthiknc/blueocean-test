pipeline {
	agent { docker 'python:3.5.1' }
	parameters {
		string(name: 'WORKFLOW', defaultValue: 'build-site', description: 'What workflow to run?')
	}
	stages {
		stage('build') {
			steps {
				sh "full=\"aws codebuild start-build --project-name nu-ecsplatform-orchestrator --environment-variables-override name=WORKFLOW,value=${params.WORKFLOW}\" && echo $full"
				echo "Running ${params.WORKFLOW}"
			}
		}
	}
}

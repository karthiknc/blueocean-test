import os
import boto3

response = boto3.client('codebuild').start_build(
    projectName='nu-ecsplatform-orchestrator',
    environmentVariablesOverride=[
        {
            'name': 'WORKFLOW',
            'value': os.environ['WORKFLOW']
        },
        {
            'name': 'SITE',
            'value': os.environ['GIT_URL'].split('/')[-1].split('.')[0]
        },
        {
            'name': 'SITE_BRANCH',
            'value': os.environ['BRANCH']
        },
        {
            'name': 'BUILD_ENV',
            'value': os.environ['BUILD_ENV']
        }
    ]
)

print(response)

import os
import boto3

client = boto3.client('codebuild')

# projects = client.list_projects()
# print(projects)

git_url = os.environ['GIT_URL']
site_git = git_url.split('/')[-1]
site = site_git.split('.')[0]
print(site)

# todo: Use build environment
env_var = os.environ['ENV']
print(env_var)

response = client.start_build(
    projectName='nu-ecsplatform-orchestrator',
    environmentVariablesOverride=[
        {
            'name': 'WORKFLOW',
            'value': os.environ['WORKFLOW']
        },
        {
            'name': 'SITE',
            'value': site
        },
        {
            'name': 'SITE_BRANCH',
            'value': os.environ['BRANCH']
        },
    ]
)

import os
import boto3

client = boto3.client('codebuild')

# projects = client.list_projects()
# print(projects)

print('WORKFLOW', os.environ['WORKFLOW'])
print('BRANCH', os.environ['BRANCH'])
print('TEST', os.environ['TEST'])
print('GIT_URL', os.environ['GIT_URL'])

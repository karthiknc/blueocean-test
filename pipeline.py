import os
import boto3

client = boto3.client('codebuild')

# projects = client.list_projects()
# print(projects)

print(os.environ)
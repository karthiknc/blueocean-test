import os
import time
import sys
import subprocess
import boto3
from botocore.exceptions import ClientError


class Pipeline:
    ARTIFACT_FILES = ['orchestrator.log']

    def __init__(self):
        if 'WORKFLOW' not in os.environ:
            print('Initial build. Exiting..')
            exit()

    def prepare(self):
        pass

    def run_build(self):
        print('Build starting..')
        for i in range(0, 10):
            time.sleep(3)
            print(i)

    def manage_artifacts(self, build_id):
        try:
            print('Fetching artifact from {}'.format(arn))
        except ClientError:
            print('Could not fetch artifact from s3 bucket.')


if __name__ == '__main__':
    pl = Pipeline()
    pl.prepare()
    bid = pl.run_build()
    pl.manage_artifacts(bid)

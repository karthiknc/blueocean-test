import os
import boto3

client = boto3.client('codebuild')

print(os.environ)
if 'WORKFLOW' not in os.environ:
	print('Initial build. Exiting..')
	exit()


def get_build_status(build_id):
    running = True
    build_success = False

    while running:
        response = client.batch_get_builds(ids=[build_id])

        for steps in response['builds']:
            if steps['buildStatus'] == 'IN_PROGRESS':
                if 'phases' in steps:
                    phases = len(steps['phases'])
                    if phases > 1:
                        end = steps['phases'][phases - 2]
                        if 'phaseType' in end and 'phaseStatus' in end:
                            print(
                                'Build in Progress... Task: %s, Status: %s'
                                % (end['phaseType'], end['phaseStatus']))
                        else:
                            print('Build in Progress...')
                    time.sleep(10)
                else:
                    print('Build in Progress...')
            elif steps['buildStatus'] == 'SUCCEEDED':
                running = False
                build_success = True
                print('Build success.')
            else:
                running = False
                print('Failed.')

    return build_success


print('Build starting..')


builder_run = client.start_build(
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

build_id = builder_run['build']['id']
print('Build ID: {}'.format(build_id))

if get_build_status(build_id):
	print('Build Success')
else:
    raise Exception('Build failed. build_id: {}'.format(build_id))

# After this get artifacts. Maybe from s3 or cloudwatch

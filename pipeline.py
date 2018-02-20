#!/bin/bash

echo ${params.WORKFLOW}
full="aws codebuild start-build --project-name nu-ecsplatform-orchestrator --environment-variables-override name=WORKFLOW,value=${params.WORKFLOW}"
echo $full

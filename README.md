# CI Image 

The repository contains the build detail for the docker image that will be used for CI checks in other projects. The dev branch contains the components of the CI image with Github Workflows to build and deploy to both Dockerhub and Amazon ECR. 

To call an use the docker image locally use the following commands for each check: 

| Check type | Dockerhub command     |
| ------------- | ------------- |
| Black | docker run --rm -v $(pwd):/mnt jackb001/ci_image-dev black --check /mnt  |
| pylint | docker run --rm -v $(pwd):/mnt jackb001/ci_image-dev pylint /mnt/*.py |
| flake8 | docker  run --rm -v $(pwd):/mnt jackb001/ci_image-dev flake8 /mnt |

Not all will have access to docker however - at a local level pre-commits referencing the versions of the linting packages used here should work - this image is more designed to assist with the checks made at remote level. 

By creating the linting image the following percieved benefits are expected: 

1. Speed: By suing a pre-built docker image with all dependeices we should avoid the time-consuming steps of settin gup the enviroment and installing packages each time the workflow runs 

2. Consistency: A custom Docker container ensure that the exact same environment (including the correct versions of the tools) is used across different runs and could also be run locally with exact same environment 

3. Simplicity: The workflow file becomes simpler because the environment setup is encapsulated in the Docker image 

4. Shareability - there will be standing repository that can be built upon with new features esier to implement in the future. 






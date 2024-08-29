#CI Image 

The repository contains the build detail for the docker image that will be used for CI checks in other projects 

Add the moment it will just build a docker image with flake8 and black in it.

In part it will be used to check the percieved  benefits of having a custom image for linting and formatting checks:

1. Speed: By suing a pre-built docker image with all dependeices we should avoid the time-consuming steps of settin gup the enviroment and installing packages each time the workflow runs 

2. Consistency: A custom Docker container ensure that the exact same environment (including the correct versions of the tools) is used across different runs and could also be run locally with exact same environment 

3. Simplicity: The workflow file becomes simpler because the environment setup is encapsulated in the Docker image 

4. Shareability - there will be standing repository that can be built upon with new features esier to implement in the future. 






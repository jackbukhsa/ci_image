# Use Python 3.12.3 as the base image
FROM python:3.12.3-slim

# Set environment variables to prevent Python from writing .pyc files and to ensure unbuffered output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create and set the working directory
WORKDIR /app

# Copy the current requirements for the versions of black and flake8 that you want
COPY requirements.txt /app/

# Copy the script that will be used to run black and flake8 on files recognised. 
COPY entrypoint.sh  /app/

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


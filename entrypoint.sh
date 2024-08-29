#!/bin/bash

# Define the mount directory
MOUNT_DIR="/mnt"

# Check if an argument was provided
if [ -n "$1" ]; then
    echo -e 'Files or Directory input detected.\n'

    # Find all Python files in the mount directory
    PYTHON_FILES=$(find "$MOUNT_DIR" -type f -name "*.py")

    # Count the number of Python files
    PYTHON_FILE_COUNT=$(echo "$PYTHON_FILES" | wc -l)

    echo "Found $PYTHON_FILE_COUNT Python file(s):"
    echo "$PYTHON_FILES"
    echo -e "\n\n"

    # Report the versions of black and flake8
    echo "Using Black version: $(black --version)"
    echo "Using Flake8 version: $(flake8 --version)"

    echo -e "\n\n"
    
    echo 'Running black'
    if black --check "$MOUNT_DIR/$1"; then
        echo 'Black check completed successfully. Proceeding to flake8'
    else
        echo 'Black check failed. Exiting.'
        exit 1
    fi

    echo -e "\n\n"

    echo 'Running flake8'
    if flake8 "$MOUNT_DIR/$1"; then
        echo 'Flake8 check completed successfully.'
    else
        echo 'Flake8 check failed. Exiting.'
        exit 1
    fi
else
    echo -e 'No file or directory provided - It is therefore assumed that you are running this image as a container on a workflow.\n
    If this is not the case and you need a reminder of how to check against files or a directory,\n
    please see the following commands:\n\n
    Run `docker run --rm -v $(pwd)/[filename.py]:/mnt/[filename.py] jackb001/python-linter [filename.py]` to use on a single file.\n
    Run `docker run --rm -v $(pwd)/[test_directory]:/mnt/[test_directory] jackb001/python-linter [test_directory]` to check a directory of multiple Python files.\n'
    exit 1
fi










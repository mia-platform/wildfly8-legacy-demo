#!/bin/bash

# A script to find and update the Wildfly Maven Plugin version in pom.xml files.

# Check if the script is run from a directory with subdirectories
if [ -z "$(find . -mindepth 1 -maxdepth 1 -type d)" ]; then
    echo "No subdirectories found. Please run this script from a directory containing project subdirectories."
    exit 1
fi

# Define the old and new version strings
OLD_VERSION="<version.wildfly.maven.plugin>1.0.2.Final</version.wildfly.maven.plugin>"
NEW_VERSION="<version.wildfly.maven.plugin>2.0.0.Final</version.wildfly.maven.plugin>"

echo "Starting the search and update process..."

# Find all pom.xml files in subdirectories and loop through them
find . -type f -name "pom.xml" -print0 | while IFS= read -r -d $'\0' pom_file; do
    echo "Processing file: $pom_file"
    
    # Use sed to replace the old version with the new one
    # The 'i' option edits the file in place. On macOS, it requires a backup extension, so we use an empty string.
    # The 's' command is for substitution.
    if sed -i 's|'$OLD_VERSION'|'$NEW_VERSION'|g' "$pom_file"; then
        echo "Successfully updated version in: $pom_file"
    else
        echo "Failed to update version in: $pom_file"
    fi
done

echo "Process complete."

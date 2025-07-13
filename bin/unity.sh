#!/usr/bin/env sh

if [ -z "$1" ]; then
	echo "Usage: unity <project path>"
	exit 1
fi

project_path="$1"
version_file="$project_path/ProjectSettings/ProjectVersion.txt"

if [ ! -f "$version_file" ]; then
	echo "Error: ProjectVersion.txt not found in $version_file"
	exit 1
fi

echo "Found ProjectVersion.txt"

version_line=$(grep "m_EditorVersion:" "$version_file")
echo "Version line: $version_line"

version=$(echo "$version_line" | sed 's/.*m_EditorVersion:[[:space:]]*//')
echo "Parsed version: $version"

if [ -z "$version" ]; then
	echo "Error: Could not parse Unity version."
	exit 1
fi

unity_path="/Applications/Unity/Hub/Editor/$version/Unity.app/Contents/MacOS/Unity"
echo "Unity path: $unity_path"

if [ ! -x "$unity_path" ]; then
	echo "Error: Unity executable not found at $unity_path"
	exit 1
fi

echo "Launching Unity $version..."
"$unity_path" -projectPath "$project_path" &

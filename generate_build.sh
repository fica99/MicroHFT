#!/bin/bash
# Script for generating build files for VS Code debugging
set -e

BUILD_DIR="build"

# Create dir if it does not exist
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Run cmake for generating build files and compile_commands.json
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..

cd ..

# Create .vscode directory if it doesn't exist
mkdir -p .vscode

# Generate tasks.json for build
cat > .vscode/tasks.json <<EOL
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "CMake Build",
            "type": "shell",
            "command": "cmake --build build",
            "group": "build",
            "problemMatcher": ["$gcc"]
        }
    ]
}
EOL

# Generate launch.json for debugging
cat > .vscode/launch.json <<EOL
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug main",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/build/microhft",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ]
        }
    ]
}
EOL

echo "VS Code solution and debug configuration generated in .vscode/"

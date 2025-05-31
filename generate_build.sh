#!/bin/bash
# Universal build generation script for CMake projects
set -e

# Prompt for build type
echo "Select build type:"
select BUILD_TYPE in "debug" "release"; do
    case $BUILD_TYPE in
        debug|release)
            BUILD_TYPE_UPPER=$(echo "$BUILD_TYPE" | tr '[:lower:]' '[:upper:]')
            break
            ;;
        *)
            echo "Please select 1 or 2."
            ;;
    esac
done

echo "Select IDE or generator for solution generation:"
select IDE in \
    "Code::Blocks" \
    "Eclipse CDT" \
    "Ninja" \
    "Unix Makefiles" \
    "Xcode (macOS only)" \
    "Visual Studio (Windows only)" \
    "CMake only"; do
    case $IDE in
        "Code::Blocks")
            GENERATOR="-G \"CodeBlocks - Unix Makefiles\""
            IDE_SUFFIX="codeblocks"
            ;;
        "Eclipse CDT")
            GENERATOR="-G \"Eclipse CDT4 - Unix Makefiles\""
            IDE_SUFFIX="eclipse"
            ;;
        "Ninja")
            GENERATOR="-G Ninja"
            IDE_SUFFIX="ninja"
            ;;
        "Unix Makefiles")
            GENERATOR="-G \"Unix Makefiles\""
            IDE_SUFFIX="makefiles"
            ;;
        "Xcode (macOS only)")
            GENERATOR="-G Xcode"
            IDE_SUFFIX="xcode"
            ;;
        "Visual Studio (Windows only)")
            echo "Visual Studio generators are only available on Windows."
            GENERATOR="-G \"Visual Studio 17 2022\""
            IDE_SUFFIX="vs2022"
            ;;
        "CMake only")
            GENERATOR=""
            IDE_SUFFIX="cmake"
            ;;
        *)
            echo "Please select a valid option."
            continue
            ;;
    esac
    break
done

BUILD_DIR="build/${BUILD_TYPE}_${IDE_SUFFIX}"

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Run cmake with the selected generator and build type
eval cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=$BUILD_TYPE_UPPER $GENERATOR ../..

cd ../..

echo "CMake solution generated in $BUILD_DIR for $IDE ($BUILD_TYPE_UPPER)"

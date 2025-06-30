#!/bin/bash

# Get the current date in DD_MM_YYYY format
CURRENT_DATE=$(date +%d_%m_%Y)

# Define the desired APK filename
DESIRED_APK_FILENAME="release_${CURRENT_DATE}.apk"

# Define the standard output directory for Flutter APKs
FLUTTER_OUTPUT_DIR="build/app/outputs/flutter-apk"

# Clean previous builds to ensure a fresh build
flutter clean

# Run the Flutter build command
# Note: --split-per-abi is recommended for Play Store, but if you want a single APK,
# remove it. If you use it, you'll need to decide which ABI's APK to rename.
flutter build apk \
  --release \
  --obfuscate \
  --split-debug-info=build/app/outputs/symbols \
  --build-name=1.0.1 \
  --build-number=1

# Check if the build was successful
if [ $? -eq 0 ]; then
  # Determine the source APK name.
  # If --split-per-abi is used, you'll have multiple. We'll pick a common one or the first one.
  # For simplicity, assuming a single 'app-release.apk' or picking one if split.
  SOURCE_APK=""
  if [ -f "${FLUTTER_OUTPUT_DIR}/app-release.apk" ]; then
    SOURCE_APK="${FLUTTER_OUTPUT_DIR}/app-release.apk"
  elif [ -f "${FLUTTER_OUTPUT_DIR}/app-arm64-v8a-release.apk" ]; then
    # If splitting by ABI, you might want to rename a specific ABI's APK.
    # Adjust this line if you need a different ABI or all of them.
    SOURCE_APK="${FLUTTER_OUTPUT_DIR}/app-arm64-v8a-release.apk"
    echo "Warning: --split-per-abi was used. Renaming 'app-arm64-v8a-release.apk'."
    echo "If you need a different ABI or all, adjust the script accordingly."
  else
    echo "Error: Could not find a generated APK in ${FLUTTER_OUTPUT_DIR}."
    exit 1
  fi

  if [ -n "$SOURCE_APK" ]; then
    # Rename the generated APK
    mv "$SOURCE_APK" "${FLUTTER_OUTPUT_DIR}/${DESIRED_APK_FILENAME}"
    echo "APK created and renamed to: ${FLUTTER_OUTPUT_DIR}/${DESIRED_APK_FILENAME}"
  fi
else
  echo "Flutter build failed. APK not created."
fi
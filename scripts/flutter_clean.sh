#!/bin/bash

set -e

echo "🧹 Flutter Clean Script"
echo "========================"

# Flutter clean
echo "▶ Running fvm flutter clean..."
fvm flutter clean

# Remove iOS Pods
echo "▶ Removing iOS Pods and Podfile.lock..."
cd ios
rm -rf Pods Podfile.lock
cd ..

# Flutter pub get
echo "▶ Running fvm flutter pub get..."
fvm flutter pub get

# precache
fvm flutter precache --ios

# Pod install
echo "▶ Running pod install..."
cd ios
pod install
cd ..

echo ""
echo "✅ Done! Project is clean and ready."
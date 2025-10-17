#!/bin/bash
# This script runs the Flutter web application.

# Navigate to the script's directory to ensure paths are correct
cd "$(dirname "$0")"

# Run the flutter app on Chrome
"/Users/muhammadnurihsanberahim/Library/Application Support/io.flutterflow.prod.mac/flutter/bin/flutter" run -d chrome

#!/bin/sh

# Test curl command
if curl -connect-timeout 5 --max-time 10 --insecure --silent --output /dev/null https://example.com; then
  echo "Curl test passed!"
else
  echo "Curl test failed!"
  exit 1
fi

# Test htmlq command
if [ -n "$(curl -connect-timeout 5 --max-time 10 --insecure --silent https://example.com | htmlq title)" ]; then
  echo "Htmlq test passed!"
else
  echo "Htmlq test failed!"
  exit 1
fi
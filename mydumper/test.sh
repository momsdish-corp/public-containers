#!/bin/sh

# Test mydumper command
if mydumper --version; then
  echo "Mydumper test passed!"
else
  echo "Mydumper test failed!"
  exit 1
fi

# Test myloader command
if myloader --version; then
  echo "Myloader test passed!"
else
  echo "Myloader test failed!"
  exit 1
fi

# Test zstd command
if zstd --version; then
  echo "Zstd test passed!"
else
  echo "Zstd test failed!"
  exit 1
fi
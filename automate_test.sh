#!/bin/bash

candidate_name=$1
exit_code=0
output=""

echo "Downloading files for $candidate_name...."

aws s3 cp s3://pre-bootcamp-bash-scripts/BC19/$candidate_name/ ./$candidate_name --recursive


echo "Create a dedicaded test folder..."

cp -r ./tests $candidate_name/tests
chmod +x $candidate_name/unpack.sh

echo "===================================="
echo "Run test one using ./$candidate_name/unpack.sh ./$candidate_name/tests/normal/*"



output=$(./$candidate_name/unpack.sh ./$candidate_name/tests/normal/)

exit_code=$?
echo "output=$output"
echo "exit-code=$exit_code"

echo "===================================="

echo "Run test one using ./$candidate_name/unpack.sh -rv ./$candidate_name/tests/recursive"

output=$(./$candidate_name/unpack.sh -rv ./$candidate_name/tests/recursive)
exit_code=$?

echo "output=$output"
echo "exit-code=$exit_code"


echo "===================================="

echo "Run test one using ./$candidate_name/unpack.sh ./$candidate_name/tests/wildcard/*"

output=$(./$candidate_name/unpack.sh -rv ./$candidate_name/tests/wildcard/*)
exit_code=$?

echo "output=$output"
echo "exit-code=$exit_code"

echo "===================================="

echo "Run test one using ./$candidate_name/unpack.sh ./$candidate_name/tests/test_folder"

output=$(./$candidate_name/unpack.sh -v ./$candidate_name/tests/test_folder)
exit_code=$?

echo "output=$output"
echo "exit-code=$exit_code"

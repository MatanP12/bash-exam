#!/bin/bash

candidate_name=$1

usage() {
    echo "Usage download_test <Candidate_Bucket_Object>"
    echo "<Candidate_Bucket_Object> specify the candidate object in S3 bucket"

}


if [ -z "$1" ] 
then 
    echo "Error: No candidate supplied"
    usage
    exit 1
fi

echo "===================================="

echo "Downloading files for $candidate_name...."

aws s3 cp s3://pre-bootcamp-bash-scripts/BC19/$candidate_name/ ./$candidate_name --recursive

echo "Create a dedicaded test folder..."

cp -r ./tests $candidate_name/tests
touch $candidate_name/feedback_$candidate_name

chmod +x $candidate_name/unpack.sh

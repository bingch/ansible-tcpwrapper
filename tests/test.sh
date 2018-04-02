#!/bin/bash


echo "test run..."
ansible-playbook -i inventory test.yml -C
if [ $? -ne 0 ]
then
  echo "test run failed"
  exit 1
fi

echo "real run..."
ansible-playbook -i inventory test.yml
if [ $? -ne 0 ]
then
  echo "real run failed"
  exit 1
fi

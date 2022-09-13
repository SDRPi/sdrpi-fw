#!/bin/bash 
while(true);
do
{
  echo "doing..."
  git submodule add https://github.com/sdrpi/buildroot
  if [ $? -eq 0 ];then
    echo "success"
    break
  else
    echo "failed"
  fi
  rm -rf buildroot
  sleep 1;
} 
done

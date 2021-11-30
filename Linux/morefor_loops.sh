#!/bin/bash

file_list=('/etc/shadow' '/etc/passwd')

for file in ${file_list[@]};
do
    permissions=$stat $file | grep -i access | grep -i uid | cut -d '( -f 2 | cut -d )' -f 1);
    echo "File $file1 permission is $permissions";
done 

for user1 in $(ls /home); 
do  id $user1 | grep sudo > /dev/null;
if  [$? = 0 ];
then 
    echo "User $user1 is having sudo rights";
else
    echo "User $user1 is not having sudo rights";
fi
done


#!/bin/bash

if [ $# != 1 ]
then
	echo "$(basename $0): Wrong count of arguments"
	exit 1
elif ! [ -d "$1" ]
then
	echo "$(basename $0): No directory"
	exit 1
fi

files=`find $(readlink -f "$1") -type f -printf "%p %s %M*" 2>error.txt`
count=0
IFS='*'
for file in $files
do
	count=$[count+1]
	echo $file
done
echo "$count"
sed -r "s/^/`basename $0`: /" error.txt>&2


#!/usr/bin/bash
#***********************
#this is a small program to manipulate folders and files, 
#it will first discover all files in the folder, and search
#content of the file, and replace content, it will perform this
#action to any file in the folders, in this way, it will receive
#a folder path, and check content in it recursively
#***********************

findandreplaceall(){
    if [ -d $0 ];then
    for file in $0;do
    cat $file
    done
}


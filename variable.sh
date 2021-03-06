#!/usr/bin/bash
#this is for explaining how bash works. to display something in bash
echo "hello world!"
guestname="lz"
meanttobeunset="something"
#if I have a list to loop, use following, in can be any expr, or path, or seq, or excuation
for file in `ls .`; do
    echo "now"
done
#this part is for echoing a variable 
echo $guestname

#then I have a parameter that I want to prevent modify after init, use readonly
readonly guestname
#what about deleting a variable
unset $meanttobeunset
echo $meanttobeunset
#to join two strings, can use something
joinedString="hello ${guestname}"
#substring of a string as char array
substring=${joinedString:1:4}
#searching a string for i or o, this part uses a reverse single quotation
echo `expr index "$string" io`
#displaying an array
anarray=(2 4 5 6)
#indexing an array
avalue=${anarray[0]}
#array count
length=${#anarray[@]}
#this is annotation
#

#to pass a value to shell script, use echo $0
echo "$0"

#to make a script runable, use chmod +x test.sh    ./test.sh 1 2 3
#to display all arguments, use $* or $@, $* makes the params a whole, and $@ an array

#expr
val=`expr 2+2`
a=20
b=40
val=`expr $a%$b`
if [$a!=$b]
then
    echo "not equqal"
fi

if [$a -eq $b]
then
    echo "equal"
fi
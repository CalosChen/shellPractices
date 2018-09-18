#!/usr/bin/bash
echo 'helo'
echo $0
if [$0 -eq 'test']
then
    echo 'yes'
fi
for file in `ls .`;do
echo $file
done
echo $@
echo $*

#to check is a folder
if [ -d $0 ];then
echo "dir"
exit 0;
else
echo "not dir"
fi
if [ -f $0 ];then
echo "file"
exit 1;
fi

getname(){
    return "calos: $1"
}
getname 23
echo $?
read sth
mkdir test
cd test
echo "yes">>test.txt

funWithParam(){
    echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    echo "第十个参数为 $10 !"
    echo "第十个参数为 ${10} !"
    echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "作为一个字符串输出所有参数 $* !"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73

funWithReturn(){
    echo "这个函数会对输入的两个数字进行相加运算..."
    echo "输入第一个数字: $1"
    read aNum
    echo "输入第二个数字: "
    read anotherNum
    echo "两个数字分别为 $aNum 和 $anotherNum !"
    return $(($aNum+$anotherNum))
}
funWithReturn 12
echo "输入的两个数字之和为 $? !"
#method with params



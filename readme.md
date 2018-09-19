# summary of bash
bash for do done
bash variables
bash arguments
bash array
bash linux commands
bash function
bash include file
bash grant execute
bash expr
bash string methods
bash if then else fi
bash dir file judgement
2018-9-19日 总结使用bash的一些要点涵盖

combat story:
assume that I have a project to deploy, this project locates on my linux server, I have the build server, the auto unit test environment, and the bash commands, I would pass arguments to the bash file, and it will decide with build command to use, thus generate files into different folders, then stop the web server, copy files into the deployment folder, then start the web server again, in the end, the changes could be seen online live.
first, because I am a developer, I want to continous integrate, thus, I use git as version control, then in bash, I will run command to pull source code into a folder, then, I will call the compiler to build and perform tests and export builds, at last, I can do the folder migration thing.
Generally, the steps are:
1. bash with environmental arguments
2. git clone
3. test and build
4. stop web server
5. copy builds into server folder locally or remotely with ssh scp
6. start web server once again
7. Just visit
the above are the 7 steps to perform a successful CI/CD I so assume
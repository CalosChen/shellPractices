#项目名称
PROJECT_NAME=ep-dynamic-forms-service
#主项目目录
MAIN_PROJECT_PATH=src/EP.DynamicForms.WebApi/EP.DynamicForms.WebApi.csproj

#EF项目
MIGRATOR_PROJECT_PATH=src/EP.DynamicForms.Migrator/EP.DynamicForms.Migrator.csproj

#部署目录
DEPLOY_PATH=/home/www/${PROJECT_NAME}
#备份目录
BACKUP_PATH=/home/backup/${PROJECT_NAME}
#要运行的Dll名称
MAIN_DLL_NAME=EP.DynamicForms.WebApi.dll
#数据迁移程序Dll名称
MIGRATOR_DLL_NAME=EP.DynamicForms.Migrator.dll

#杀掉之前启动的进程
if [ -f "${DEPLOY_PATH}/stop.pid" ]
then
	PID=$(cat ${DEPLOY_PATH}/stop.pid)
	IS_EXIST=`ps -ef |grep $PID |grep -v "grep" |wc -l`
	if [ 1 == $IS_EXIST ]
	then  
    	kill -9 $PID
	fi  
fi

#备份上次运行的文件
#today=`date +%Y%m%d%H%M%S`
#if [ ! -d "${BACKUP_PATH}/$today" ]
#then
#	mkdir -p ${BACKUP_PATH}/$today
#fi

#if [ -d "${DEPLOY_PATH}" ]
#then
#	mv ${DEPLOY_PATH}/** ${BACKUP_PATH}/$today/
#fi

#项目编译打包及部署
dotnet restore ${WORKSPACE}
dotnet build ${WORKSPACE}

dotnet publish ${WORKSPACE}/${MIGRATOR_PROJECT_PATH} -o ${DEPLOY_PATH} -c "RELEASE"
dotnet publish ${WORKSPACE}/${MAIN_PROJECT_PATH} -o ${DEPLOY_PATH} -c "RELEASE"

#启动项目
BUILD_ID=DONTKILLME
source /etc/profile
cd ${DEPLOY_PATH}

#执行数据迁移
dotnet ${DEPLOY_PATH}/${MIGRATOR_DLL_NAME} -q

#启动服务
nohup dotnet ${DEPLOY_PATH}/${MAIN_DLL_NAME} > nohup.out &
#记录项目进程号
echo $! > ${DEPLOY_PATH}/stop.pid

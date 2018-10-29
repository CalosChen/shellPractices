#1.
.\.nuget\nuget.exe restore EP.Framework.sln
#2. for .sln and publish profile
/t:Rebuild /p:Configuration=Release /p:DeployOnBuild=True;PublishProfile=ep-bi-service
#3. for annotation files
copy /y .\EP.Framework.Application\bin\Release\EP.Framework.Application.xml D:\Web发布\ep-bi-service\bin

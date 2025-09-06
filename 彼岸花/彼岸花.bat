@echo off
chcp 65001 >nul
title 彼岸花浏览器

rem 获取批处理文件所在目录
set "current_dir=%~dp0"
set "current_dir=%current_dir:~0,-1%"

rem 检查HTML文件是否存在
if not exist "%current_dir%\彼岸花.html" (
    echo 错误: 找不到HTML文件
    echo 请确保所有文件在同一文件夹内
    pause
    exit /b 1
)

rem 检查视频文件是否存在
if not exist "%current_dir%\66666.mp4" (
    echo 警告: 找不到视频文件，页面可能无法正常显示
)

rem 构建URL路径
set "url_path=%current_dir:\=/%"
set "url=file:///%url_path%/彼岸花.html"

echo 正在启动彼岸花浏览器...
echo 请稍候...

rem 尝试使用默认浏览器打开
start "" "msedge.exe" --app="%url%" --window-size=1200,800

rem 如果Edge无法打开，尝试使用默认浏览器
timeout /t 2 /nobreak >nul
start "" "%url%"

exit /b 0
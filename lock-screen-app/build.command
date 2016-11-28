cd "$(dirname "$0")"

clang -framework Foundation main.m -o lockscreen
osacompile -o 'Lock Screen.app' 'Lock Screen Bundle.applescript'
cp Lock\ Screen.icns Lock\ Screen.app/Contents/Resources/applet.icns
touch Lock\ Screen.app/Contents/Resources/applet.icns
cp lockscreen Lock\ Screen.app/Contents/Resources/Scripts/lockscreen

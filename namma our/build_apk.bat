@echo off
echo ==========================================
echo    Namma Oour APK Builder
echo ==========================================
echo.

:: Check if Flutter is installed
flutter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Flutter is not installed or not in your PATH.
    echo Please install Flutter from https://docs.flutter.dev/get-started/install
    pause
    exit /b
)

echo [1/3] Fetching dependencies...
call flutter pub get

echo [2/3] Preparing Android project structure...
call flutter create --platforms=android .

echo [3/3] Building APK...
call flutter build apk --release

echo.
echo ==========================================
echo [SUCCESS] Your APK is ready!
echo Location: build\app\outputs\flutter-apk\app-release.apk
echo ==========================================
echo.
pause

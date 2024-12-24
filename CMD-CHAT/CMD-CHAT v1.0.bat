@echo off
setlocal enabledelayedexpansion
title CMD Chat

:: Initialization
set ChatFile=chat.txt

:: Ask for the username on the first run
:inputname
cls
echo ========================================
echo Welcome to CMD Chat
echo ========================================
echo.
set /p UserName=Enter your name: 
if "!UserName!"=="" (
    echo Name cannot be empty. Please try again.
    pause>nul
    goto inputname
)


:: Main menu
:mainmenu
cls
echo ========================================
echo Welcome to CMD Chat
echo Your Name: %UserName%
echo ========================================
echo [1] View Messages
echo [2] Send Message
echo [3] Change Name
echo [4] Exit
echo ========================================
set /p choice=Please select a menu: 

if "%choice%"=="1" goto viewmessages
if "%choice%"=="2" goto sendmessage
if "%choice%"=="3" goto changename
if "%choice%"=="4" exit
goto mainmenu

:: Menu to view messages
:viewmessages
cls
echo ========================================
echo Chat Log:
type "%ChatFile%" 2>nul
echo ========================================
pause
goto mainmenu

:: Menu to send messages
:sendmessage
cls
echo ========================================
echo Type your message (Type "cancel" to return to the main menu):
set /p Message=[%UserName%]: 
if /i "!Message!"=="cancel" goto mainmenu
(echo [%UserName%]: !Message!) >> "%ChatFile%"
goto mainmenu

:: Menu to change name
:changename
cls
echo ========================================
echo Change Username
echo Your current name: %UserName%
echo ========================================
set /p NewName=Enter a new name (Type "cancel" to cancel): 
if /i "!NewName!"=="cancel" goto mainmenu
if "!NewName!"=="" (
    echo Name cannot be empty. Please try again.
    pause>nul
    goto changename
)
set UserName=!NewName!
echo Your name has been changed to: %UserName%
pause>nul
goto mainmenu

@echo off
setlocal EnableDelayedExpansion

:: Configuration
:: -------------
:: Author: Dasa Elayavilli Ponnappan
:: Description: Interactive installer for Gemini Workflows (Windows)

:: Title
title Gemini Workflows Installer

:: Header
powershell -Command "Write-Host '=================================================' -ForegroundColor Cyan"
powershell -Command "Write-Host '      Gemini Workflows Interactive Installer     ' -ForegroundColor Cyan"
powershell -Command "Write-Host '=================================================' -ForegroundColor Cyan"
echo Author: Dasa Elayavilli Ponnappan (dasa@manizh.com)
echo.

:: 1. Target Directory Prompt
:: --------------------------
set "DEFAULT_DIR=.agent\workflows"
set /p "TARGET_DIR=Enter target installation directory [Default: .agent\workflows]: "
if "!TARGET_DIR!"=="" set "TARGET_DIR=!DEFAULT_DIR!"

powershell -Command "Write-Host '[INFO] Installing to: !TARGET_DIR!' -ForegroundColor Yellow"

:: Check if directory exists, create if not
if not exist "!TARGET_DIR!" (
    powershell -Command "Write-Host '[WARN] Directory does not exist. Creating it...' -ForegroundColor Yellow"
    mkdir "!TARGET_DIR!"
    if errorlevel 1 (
        powershell -Command "Write-Host '[ERR] Failed to create directory. Check permissions.' -ForegroundColor Red"
        pause
        exit /b 1
    ) else (
        powershell -Command "Write-Host '[OK] Created !TARGET_DIR!' -ForegroundColor Green"
    )
) else (
    powershell -Command "Write-Host '[OK] Directory exists.' -ForegroundColor Green"
)

:: 2. Copy Workflows
:: -----------------
echo.
powershell -Command "Write-Host '--- Copying Workflow Files ---' -ForegroundColor Cyan"

set "COUNT=0"
for %%f in (*.md) do (
    if /I not "%%f"=="README.md" if /I not "%%f"=="SETUP.md" (
        copy /Y "%%f" "!TARGET_DIR!\" >nul
        powershell -Command "Write-Host '  ✔ Copied %%f' -ForegroundColor Green"
        set /a COUNT+=1
    )
)

powershell -Command "Write-Host '[SUCCESS] Copied !COUNT! workflow files.' -ForegroundColor Green"
echo.

:: 3. Environment Check
:: --------------------
powershell -Command "Write-Host '--- Environment Check ---' -ForegroundColor Cyan"

:: Assume project root is parent of target dir if target starts with .agent
if "!TARGET_DIR:~0,6!"==".agent" (
    set "ENV_FILE=.env"
) else (
    set "ENV_FILE=.env"
)

if exist "!ENV_FILE!" (
    powershell -Command "Write-Host '[OK] Found .env file.' -ForegroundColor Green"
) else (
    powershell -Command "Write-Host '[MISSING] No .env file found.' -ForegroundColor Red"
    set /p "CREATE_ENV=Do you want to create a template .env file? (y/n): "
    if /I "!CREATE_ENV!"=="y" (
        type nul > "!ENV_FILE!"
        powershell -Command "Write-Host '[OK] Created empty .env file.' -ForegroundColor Green"
    ) else (
        powershell -Command "Write-Host '[SKIP] Skipping .env creation.' -ForegroundColor Yellow"
    )
)

:: 4. API Key Check
:: ----------------
if exist "!ENV_FILE!" (
    echo.
    powershell -Command "Write-Host '--- Checking API Keys ---' -ForegroundColor Cyan"
    
    set "MISSING=0"
    
    findstr /B "ANTHROPIC_API_KEY=" "!ENV_FILE!" >nul
    if errorlevel 1 (
        powershell -Command "Write-Host '[MISSING] ANTHROPIC_API_KEY is missing.' -ForegroundColor Red"
        set "MISSING=1"
    ) else (
        powershell -Command "Write-Host '[OK] ANTHROPIC_API_KEY found.' -ForegroundColor Green"
    )

    findstr /B "OPENAI_API_KEY=" "!ENV_FILE!" >nul
    if errorlevel 1 (
        powershell -Command "Write-Host '[MISSING] OPENAI_API_KEY is missing.' -ForegroundColor Red"
        set "MISSING=1"
    ) else (
        powershell -Command "Write-Host '[OK] OPENAI_API_KEY found.' -ForegroundColor Green"
    )

    findstr /B "GOOGLE_API_KEY=" "!ENV_FILE!" >nul
    if errorlevel 1 (
        powershell -Command "Write-Host '[MISSING] GOOGLE_API_KEY is missing.' -ForegroundColor Red"
        set "MISSING=1"
    ) else (
        powershell -Command "Write-Host '[OK] GOOGLE_API_KEY found.' -ForegroundColor Green"
    )

    if "!MISSING!"=="1" (
        echo.
        powershell -Command "Write-Host 'Some keys are missing.' -ForegroundColor Yellow"
        set /p "APPEND_KEYS=Would you like to append placeholders for them? (y/n): "
        if /I "!APPEND_KEYS!"=="y" (
            echo. >> "!ENV_FILE!"
            echo # Added by Gemini Workflows Installer >> "!ENV_FILE!"
            echo ANTHROPIC_API_KEY= >> "!ENV_FILE!"
            echo OPENAI_API_KEY= >> "!ENV_FILE!"
            echo GOOGLE_API_KEY= >> "!ENV_FILE!"
            powershell -Command "Write-Host '[ADDED] Placeholders added to .env' -ForegroundColor Green"
            powershell -Command "Write-Host '[ACTION REQUIRED] Please open .env and fill in the API keys.' -ForegroundColor Yellow"
        )
    ) else (
        echo.
        powershell -Command "Write-Host '[PERFECT] All required API keys are present!' -ForegroundColor Green"
    )
)

:: Footer
echo.
powershell -Command "Write-Host '=================================================' -ForegroundColor Cyan"
powershell -Command "Write-Host '      Installation Complete! 🚀      ' -ForegroundColor Green"
powershell -Command "Write-Host '=================================================' -ForegroundColor Cyan"
echo You can now use the workflows in your AI IDE.

echo.
powershell -Command "Write-Host '--- 💡 Usage Examples ---' -ForegroundColor Cyan"
powershell -Command "Write-Host '1. Backend Development:  @agent_backend_expert \"Design a User API\"' -ForegroundColor Yellow"
powershell -Command "Write-Host '2. Frontend Development: @agent_frontend_expert \"Refactor the Dashboard\"' -ForegroundColor Yellow"
powershell -Command "Write-Host '3. Security Audit:       @agent_audit_expert \"Audit the auth module\"' -ForegroundColor Yellow"
powershell -Command "Write-Host '4. Infrastructure:       @agent_infrastructure_expert \"Optimise GKE cost\"' -ForegroundColor Yellow"
powershell -Command "Write-Host '5. Jira Ticket:          @create_jira_ticket \"Bug: Fix login crash\"' -ForegroundColor Yellow"

echo.
powershell -Command "Write-Host '💡 Pro Tip: Chain them for E2E flow!' -ForegroundColor Cyan"
powershell -Command "Write-Host '   Code (@agent_backend_expert) -> Audit (@agent_audit_expert) -> Deploy (@backend_deploy)' -ForegroundColor Green"

pause

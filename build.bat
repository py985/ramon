@echo off
title Building ramon ...
echo.
echo   ╔═══════════════════════════════════════╗
echo   ║    🚀 GERANDO INSTALADOR             ║
echo   ╚═══════════════════════════════════════╝
echo.
echo 🔍 Verificando Node.js...
where node >nul 2>nul
if %errorlevel% neq 0 (
  echo ❌ Node.js nao encontrado!
  echo.
  echo Por favor, instale o Node.js em: https://nodejs.org/
  echo E execute este script novamente.
  pause
  exit /b 1
)
echo ✅ Node.js encontrado!
echo.
echo 📦 Instalando dependencias (npm install)...
call npm install --silent
if %errorlevel% neq 0 (
  echo ❌ Erro ao instalar dependencias.
  pause
  exit /b 1
)
echo ✅ Dependencias instaladas!
echo.
echo ⚙️ Compilando aplicativo (npm run make)...
call npm run make --silent
if %errorlevel% neq 0 (
  echo ❌ Erro na compilacao.
  pause
  exit /b 1
)
echo.
echo ✅ Compilacao concluida com sucesso!
echo.
echo 📁 O instalador esta em: out\make\
echo.
echo Abrindo a pasta...
start out\make
echo.
echo Pressione qualquer tecla para sair.
pause >nul
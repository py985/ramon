#!/bin/bash
echo ""
echo "  ╔═══════════════════════════════════════╗"
echo "  ║    🚀 GERANDO INSTALADOR             ║"
echo "  ╚═══════════════════════════════════════╝"
echo ""
echo "🔍 Verificando Node.js..."
if ! command -v node &> /dev/null; then
  echo "❌ Node.js nao encontrado!"
  echo ""
  echo "Por favor, instale o Node.js em: https://nodejs.org/"
  echo "E execute este script novamente."
  read -p "Pressione Enter para sair..."
  exit 1
fi
echo "✅ Node.js encontrado!"
echo ""
echo "📦 Instalando dependencias (npm install)..."
npm install --silent
if [ $? -ne 0 ]; then
  echo "❌ Erro ao instalar dependencias."
  read -p "Pressione Enter para sair..."
  exit 1
fi
echo "✅ Dependencias instaladas!"
echo ""
echo "⚙️ Compilando aplicativo (npm run make)..."
npm run make --silent
if [ $? -ne 0 ]; then
  echo "❌ Erro na compilacao."
  read -p "Pressione Enter para sair..."
  exit 1
fi
echo ""
echo "✅ Compilacao concluida com sucesso!"
echo ""
echo "📁 O instalador esta em: out/make/"
echo ""
echo "Abrindo a pasta..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  open out/make
else
  xdg-open out/make
fi
echo ""
read -p "Pressione Enter para sair..."
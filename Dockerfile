FROM n8nio/n8n:latest

# Permite rodar comandos como root
USER root

# Instala ts-node e TypeScript globalmente
RUN npm install -g ts-node typescript

# Define o caminho global de módulos para o Node
ENV NODE_PATH=/usr/local/lib/node_modules

# Retorna ao usuário padrão do n8n
USER node

WORKDIR /home/node

# Instala os pacotes necessários para LangChain + OpenAI
RUN npm install --prefix /home/node/.n8n @n8n/n8n-nodes-langchain langchain@0.3.4 openai --legacy-peer-deps

# Ativa os nós da comunidade e o suporte ao LangChain
ENV N8N_COMMUNITY_NODES_ENABLED=true
ENV N8N_CUSTOM_EXTENSIONS=/home/node/.n8n/node_modules/@n8n/n8n-nodes-langchain
ENV N8N_AUTO_INSTALL_NODES=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=@n8n/n8n-nodes-langchain,langchain,openai

# ⚠️ Correção importante: usar ts-node/esm.mjs
ENV NODE_OPTIONS="--no-warnings --loader ts-node/esm.mjs"

# Inicia o n8n
CMD ["n8n"]

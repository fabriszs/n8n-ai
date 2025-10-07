FROM n8nio/n8n:latest

# Permite instalação global
USER root

# Instala ts-node e TypeScript globalmente
RUN npm install -g ts-node typescript

# Garante que o Node encontre módulos globais
ENV NODE_PATH=/usr/local/lib/node_modules

# Volta para o usuário padrão
USER node

WORKDIR /home/node

# Instala LangChain e OpenAI localmente para o n8n
RUN npm install --prefix /home/node/.n8n @n8n/n8n-nodes-langchain langchain@0.3.4 openai --legacy-peer-deps

# Define variáveis de ambiente necessárias
ENV N8N_COMMUNITY_NODES_ENABLED=true
ENV N8N_CUSTOM_EXTENSIONS=/home/node/.n8n/node_modules/@n8n/n8n-nodes-langchain
ENV N8N_AUTO_INSTALL_NODES=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=@n8n/n8n-nodes-langchain,langchain,openai
ENV NODE_OPTIONS="--no-warnings --loader ts-node/esm"

# Define o ponto de entrada do n8n
CMD ["n8n"]

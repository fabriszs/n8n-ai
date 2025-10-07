FROM n8nio/n8n:latest

# Troca temporariamente para root para permitir instalação global
USER root

# Instala ts-node e TypeScript globalmente com permissão de root
RUN npm install -g ts-node typescript

# Volta para o usuário padrão do n8n
USER node

WORKDIR /home/node

# Instala os pacotes do LangChain e OpenAI dentro do diretório do n8n
RUN npm install --prefix /home/node/.n8n @n8n/n8n-nodes-langchain langchain@0.3.4 openai --legacy-peer-deps

# Define as variáveis de ambiente necessárias
ENV N8N_COMMUNITY_NODES_ENABLED=true
ENV N8N_CUSTOM_EXTENSIONS=/home/node/.n8n/node_modules/@n8n/n8n-nodes-langchain
ENV N8N_AUTO_INSTALL_NODES=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=@n8n/n8n-nodes-langchain,langchain,openai
ENV NODE_OPTIONS="--no-warnings --loader ts-node/esm"

# Executa o n8n normalmente
CMD ["n8n"]


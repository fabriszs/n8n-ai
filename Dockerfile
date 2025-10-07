FROM n8nio/n8n:latest

WORKDIR /home/node

# Instala dependências necessárias
RUN npm install -g ts-node typescript

# Instala os nós e dependências da LangChain e OpenAI
RUN npm install --prefix /home/node/.n8n @n8n/n8n-nodes-langchain langchain@0.3.4 openai --legacy-peer-deps

# Variáveis de ambiente necessárias para n8n reconhecer os nós
ENV N8N_COMMUNITY_NODES_ENABLED=true
ENV N8N_CUSTOM_EXTENSIONS=/home/node/.n8n/node_modules/@n8n/n8n-nodes-langchain
ENV N8N_AUTO_INSTALL_NODES=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=@n8n/n8n-nodes-langchain,langchain,openai
ENV NODE_OPTIONS="--no-warnings --loader ts-node/esm"

CMD ["n8n"]

FROM n8nio/n8n:latest

USER root

WORKDIR /home/node

# Instala ts-node e typescript localmente (sem precisar de acesso root global)
RUN npm init -y && \
    npm install ts-node typescript @n8n/n8n-nodes-langchain langchain@0.3.4 openai --legacy-peer-deps

# Configura variáveis de ambiente para n8n e LangChain
ENV N8N_COMMUNITY_NODES_ENABLED=true
ENV N8N_CUSTOM_EXTENSIONS=/home/node/node_modules/@n8n/n8n-nodes-langchain
ENV N8N_AUTO_INSTALL_NODES=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=@n8n/n8n-nodes-langchain,langchain,openai
ENV NODE_OPTIONS="--no-warnings --loader ts-node/esm.mjs"

USER node

CMD ["n8n"]

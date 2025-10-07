FROM n8nio/n8n:latest
WORKDIR /home/node
RUN npm install --prefix /home/node/.n8n @n8n/n8n-nodes-langchain langchain@0.3.4 --legacy-peer-deps
ENV N8N_COMMUNITY_NODES_ENABLED=true
ENV N8N_CUSTOM_EXTENSIONS=/home/node/.n8n/node_modules/@n8n/n8n-nodes-langchain
ENV N8N_AUTO_INSTALL_NODES=true
ENV NODE_FUNCTION_ALLOW_EXTERNAL=@n8n/n8n-nodes-langchain,langchain,openai
ENV NODE_OPTIONS="--no-warnings --loader ts-node/esm"
CMD ["n8n"]

# n8n + OpenAI + LangChain

Este projeto cria uma instância personalizada do **n8n** com suporte nativo a **LangChain** e **OpenAI**, ideal para automações com IA generativa.

## 🚀 O que faz
- Adiciona os nós da comunidade do n8n (`@n8n/n8n-nodes-langchain`)
- Instala `langchain@0.3.4` para compatibilidade com módulos ESM
- Permite criar automações inteligentes com GPT e fluxos conectados à IA

## ⚙️ Como funciona
O build usa o arquivo **Dockerfile**, que executa:
```dockerfile
FROM n8nio/n8n:latest
RUN npm install --prefix /home/node/.n8n @n8n/n8n-nodes-langchain langchain@0.3.4 --legacy-peer-deps

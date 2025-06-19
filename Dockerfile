FROM n8nio/n8n:latest

# 作業ディレクトリの設定
WORKDIR /home/node

# 必要なディレクトリの作成と権限設定
USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod -R 700 /home/node/.n8n

# nodeユーザーに切り替え
USER node

# 環境変数の設定
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV WEBHOOK_URL=https://my-n8n-railway-production.up.railway.app/
ENV N8N_EDITOR_BASE_URL=https://my-n8n-railway-production.up.railway.app/
ENV EXECUTIONS_PROCESS=main
ENV N8N_LOG_LEVEL=info
ENV DB_TYPE=sqlite
ENV DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite

# ポートの公開
EXPOSE 5678

# ヘルスチェック用のスクリプト
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

# n8nの起動
CMD ["n8n", "start"]

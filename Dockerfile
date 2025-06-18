# Railway用のn8n Dockerfile
FROM n8nio/n8n:latest

# 作業ディレクトリ
WORKDIR /home/node

# 環境変数設定（Railwayで自動設定されるポート）
ENV N8N_PORT=$PORT
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=https://$RAILWAY_STATIC_URL

# ポート公開（Railwayが自動的に割り当て）
EXPOSE $PORT

# n8n起動
CMD ["n8n", "start"]


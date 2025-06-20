FROM node:18-alpine

# 作業ディレクトリ
WORKDIR /home/node

# 🔥 本番環境設定を完全に強制（重要！）
ENV NODE_ENV=production
ENV N8N_ENV=production
ENV N8N_DEV_RELOAD=false
ENV N8N_DEVELOPMENT_MODE=false
ENV N8N_PREVIEW_MODE=false
ENV DEBUG=false
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_VERSION_NOTIFICATIONS_ENABLED=false
ENV N8N_HIRING_BANNER_ENABLED=false

# package.jsonをコピー
COPY package*.json ./

# 依存関係をプロダクション用インストール
RUN npm ci --production --no-optional

# 既存のnodeユーザーを使用して権限設定
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod -R 700 /home/node/.n8n

# nodeユーザーに切り替え
USER node

# ポート公開
EXPOSE 5678

# 🚀 本番モードでn8n起動（package.jsonのscriptを使用）
CMD ["npm", "start"]

FROM node:18-alpine

# 作業ディレクトリ
WORKDIR /home/node

# n8nをグローバルインストール
RUN npm install -g n8n

# nodeユーザーの作成と権限設定
RUN addgroup -g 1000 node && \
    adduser -u 1000 -G node -s /bin/sh -D node

RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod -R 700 /home/node/.n8n

# nodeユーザーに切り替え
USER node

# ポート公開
EXPOSE 5678

# n8n起動
CMD ["n8n"]

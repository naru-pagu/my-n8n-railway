FROM n8nio/n8n:latest

# 作業ディレクトリの設定
WORKDIR /home/node

# rootユーザーで権限設定
USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod -R 700 /home/node/.n8n

# nodeユーザーに切り替え
USER node

# ポートの公開
EXPOSE 5678

# n8nの完全パスで起動
CMD ["/usr/local/bin/node", "/usr/local/lib/node_modules/n8n/bin/n8n"]

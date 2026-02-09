# ビルドステージ
FROM node:20-alpine AS builder

# pnpmをインストール
RUN npm install -g pnpm

# ワーキングディレクトリを設定
WORKDIR /app

# package.jsonとpnpm-lock.yamlをコピー
COPY package.json pnpm-lock.yaml ./

# 依存関係をインストール
RUN pnpm install --frozen-lockfile

# ソースコードをコピー
COPY . .

# TypeScriptの型定義をグローバルにインストール（YouTube IFrame API用）
RUN pnpm add -D @types/youtube

# ビルドを実行
RUN pnpm run build

# 実行ステージ
FROM nginx:alpine

# nginx設定をコピー
COPY nginx.conf /etc/nginx/nginx.conf

# ビルド済みファイルと静的リソースをnginxにコピー
COPY --from=builder /app/dist /usr/share/nginx/html/dist
COPY --from=builder /app/index.html /usr/share/nginx/html/

# ポートを公開
EXPOSE 80

# nginxを起動
CMD ["nginx", "-g", "daemon off;"]

# ベースイメージを指定
FROM node:20-alpine

# 作業ディレクトリを設定
WORKDIR /app

# パッケージファイルをコピー
COPY package.json package-lock.json* ./

# 依存関係をインストール
RUN npm install

# アプリケーションコードをコピー
COPY . .

# ビルド
RUN npm run build

# 環境変数
ENV NODE_ENV=production

# ポート指定
EXPOSE 3000

# アプリケーション起動
CMD ["npm", "start"]
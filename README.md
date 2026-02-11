# YouTube ループプレイヤー

YouTubeの動画を指定区間でループ再生し、左右反転ができるWebアプリケーションです。

## 特徴

- YouTube動画のリンクを入力して再生
- 指定した区間をループ再生
- 動画の左右反転（ミラー表示）
- キーボードショートカット対応（L: ループトグル、F: 反転トグル）

## 技術スタック

- **言語**: TypeScript
- **パッケージマネージャー**: pnpm (Nixで管理)
- **ビルド**: Vite
- **Linter**: ESLint
- **ホスティング**: Docker (nginx)

## 開発環境のセットアップ

### 前提条件

- Nix ( flakes が有効化されていること)

### インストール

```bash
# Nix開発環境に入る
nix develop

# 依存関係をインストール
pnpm install
```

## 利用可能なスクリプト

```bash
# 型チェック
pnpm type-check

# 開発サーバー起動（監視コンパイル付き）
pnpm dev

# Linterの実行
pnpm lint

# Linterの自動修正
pnpm lint:fix

# クリーン（distディレクトリ削除）
pnpm clean

# ビルド
pnpm build

# プレビューサーバー（ビルド結果の確認）
pnpm preview
```

## 開発手順

1. Nix開発環境に入る
   ```bash
   nix develop
   ```

2. 依存関係をインストール（初回のみ）
   ```bash
   pnpm install
   ```

3. 開発サーバーを起動
   ```bash
   pnpm dev
   ```

4. ブラウザで http://localhost:5173 にアクセス

※ Viteの開発サーバーはファイル監視とホットリロード（HMR）が自動的に有効になっています。

## Dockerでの実行

```bash
# Dockerイメージのビルド
docker build -t yt-fliploop .

# コンテナの実行
docker run -d -p 80:80 yt-fliploop

# ブラウザで http://localhost にアクセス
```

## CI/CD

GitHub Actionsを使用して、以下のチェックを自動実行しています：

- ESLintによるコード品質チェック
- TypeScriptの型チェック
- プロジェクトのビルド

## プロジェクト構成

```
yt-fliploop/
├── .github/
│   └── workflows/
│       └── ci.yml           # GitHub Actions設定
├── src/
│   └── main.ts              # メインスクリプト
├── index.html               # エントリーポイント
├── package.json             # パッケージ設定
├── pnpm-lock.yaml          # pnpmのロックファイル
├── tsconfig.json            # TypeScript設定
├── eslint.config.js         # ESLint設定（Flat Config）
├── flake.nix               # Nix開発環境設定
├── Dockerfile               # Dockerビルド設定
├── nginx.conf               # nginx設定
└── README.md                # このファイル
```

## ライセンス

MIT

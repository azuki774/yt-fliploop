{
  description = "YouTube ループプレイヤー開発環境";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            nodejs_20
            pnpm
            corepack  # pnpmのCorepack対応
          ];

          shellHook = ''
            echo "YouTube ループプレイヤー開発環境"
            echo "Node.js: $(node --version)"
            echo "pnpm: $(pnpm --version)"
            echo ""
            echo "利用可能なコマンド:"
            echo "  pnpm install - 依存関係のインストール"
            echo "  pnpm dev     - 開発サーバー起動"
            echo "  pnpm build   - ビルド"
            echo "  pnpm lint    - リントチェック"
          '';
        };
      }
    );
}

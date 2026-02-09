/**
 * YouTube ループプレイヤー - メインエントリーポイント
 */

// DOM要素が読み込まれた後に初期化
document.addEventListener('DOMContentLoaded', () => {
    const statusElement = document.getElementById('status');
    if (statusElement) {
        statusElement.textContent = 'ビルド環境のセットアップ完了！';
        statusElement.style.color = '#4CAF50';
    }

    console.log('YouTube ループプレイヤーが初期化されました');
});

// サンプル関数 - TypeScript型チェックの確認用
function greet(name: string): string {
    return `こんにちは、${name}さん！`;
}

// テスト出力（警告許容済み）
console.log(greet('ユーザー'));

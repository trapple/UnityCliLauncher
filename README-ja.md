# UnityCliLauncher

指定されたプロジェクトのUnityバージョンを自動検出し、適切なUnityエディターを起動するshスクリプトです。複数バージョンの開発環境で便利です。

## インストール

1. スクリプトを適当な場所にコピー:

zshの場合:
```bash
cp bin/unity.sh ~/.zsh/unity.sh
chmod +x ~/.zsh/unity.sh
```

bashの場合:
```bash
cp bin/unity.sh ~/.local/bin/unity.sh
chmod +x ~/.local/bin/unity.sh
```

2. シェル設定ファイルにエイリアスを追加:

zshの場合 (`.zshrc`):
```bash
alias unity='~/.zsh/unity.sh'
```

bashの場合 (`.bashrc` または `.bash_profile`):
```bash
alias unity='~/.local/bin/unity.sh'
```

3. シェル設定を再読み込み:
```bash
exec $SHELL -l
```

## 使用方法

```bash
unity <プロジェクトパス>
```

## 仕組み

1. 指定されたプロジェクトの`ProjectSettings/ProjectVersion.txt`を読み込み
2. `m_EditorVersion`からUnityバージョンを抽出
3. `/Applications/Unity/Hub/Editor/`から該当バージョンのUnityを検索
4. 見つかったUnityエディターでプロジェクトを起動

## 必要条件

- macOS
- Unity Hub経由でインストールされたUnity（標準パス）

## 互換性

- sh
- zsh
- bash
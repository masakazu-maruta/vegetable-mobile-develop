# 開発で利用するディレクトリ

- app ... go(echo)開発用
- client ... react-native 開発用

# 初期設定

- clone してきたプロジェクトを VSCode で開く
- .env ファイルを作成して、.env.example の内容をコピー(適宜内容変更してください)
- client/.env ファイルを作成して、client/.env.example の内容をコピー(適宜内容変更してください)

# 開発の方法

- clone してきたプロジェクトを VSCode で開く
- コンテナーで再度開く
- ビルドが完了したら、ターミナルを二つ開く

1. **Goバックエンドの起動**
   - ターミナルで `/workspace/app` ディレクトリに移動
   - 以下のコマンドを実行してGoバックエンドを起動します:
     ```bash
     go run main.go
     ```

2. **Reactフロントエンドの起動**
   - ターミナルで `/workspace/client` ディレクトリに移動
   - 以下のコマンドで依存関係をインストールします:
     ```bash
     npm install
     ```
   - 次に、フロントエンドを起動するために以下のコマンドを実行します:
     ```bash
     npm run start
     ```
   - `npm run android` とすると android の実行環境が立ち上がる
      -  android実行環境でのリロード：`npm run android` を実行したターミナルで `r` を入力してEnter

# 使用パッケージ

## go

- github.com/labstack/echo/v4
- github.com/joho/godotenv
- gorm.io/gorm
- gorm.io/driver/postgres

## react native

## その他

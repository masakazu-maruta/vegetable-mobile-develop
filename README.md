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
  `/workspace/app` で `go run main.go`
  `/workspace/client` で `npm install` をしてから `npm run start`
  すると、プロジェクトが立ち上がる
- npm run android とすると android の実行環境が立ち上がる

# 使用パッケージ

## go

- github.com/labstack/echo/v4
- github.com/joho/godotenv
- gorm.io/gorm
- gorm.io/driver/postgres

## react native

## その他

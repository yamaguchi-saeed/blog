# README

ブログプラットフォーム

Ruby on Rails と Vue.js で構築されたミニマルなブログプラットフォーム。

機能

記事管理（作成、閲覧、更新、削除）

カテゴリとタグの整理

Vue.js を活用した検索およびフィルタリング

ユーザー認証システム

モバイルデバイス向けのレスポンシブデザイン

必要要件

Ruby 3.3.7

Rails 8

SQLite3

セットアップ手順

リポジトリをクローン:

git clone https://github.com/yamaguchi-saeed/blog.git
cd simple_blog

依存関係をインストール:

bundle install

データベースをセットアップ:

rails db:create
rails db:migrate
rails db:seed

Rails サーバーを起動:

rails server

ブラウザで http://localhost:3000 にアクセス

デフォルトのログイン情報

シードデータ作成時にデフォルトのユーザーが作成されます:

メールアドレス: name@example.com

パスワード: password

実装詳細

バックエンド（Ruby on Rails）

モデル: Article, Category, Tag, User, ArticleTag（中間テーブル）

コントローラー: Articles, Categories, Tags, Sessions, Users

認証: bcrypt を使用したパスワードハッシュ化

データベース: シンプルな構成のため SQLite を採用

フロントエンド

Vue.js: ホームページの記事フィルタリングシステムに使用

CSS フレームワーク: Tailwind CSS を使用したレスポンシブデザイン

レスポンシブデザイン: モバイルファーストアプローチで、レスポンシブブレイクポイントを適用

プロジェクト構成

app/models/ - データベースモデルとリレーション

app/controllers/ - アプリケーションのコントローラー

app/views/ - ERB テンプレート

app/javascript/components/ - Vue.js コンポーネント

db/ - データベースのマイグレーションおよびシードファイル












English translation:

Blog Platform
A minimalist blog platform built with Ruby on Rails and Vue.js.

Features
Article management (create, read, update, delete)
Category and tag organization
Vue.js-powered search and filtering
User authentication system
Responsive design for mobile devices

Requirements
Ruby 3.3.7
Rails 8
SQLite3

Setup Instructions

Clone the repository:
bashCopygit clone https://github.com/yamaguchi-saeed/blog.git
cd simple_blog

Install dependencies:
bashCopybundle install

Set up the database:
bashCopyrails db:create
rails db:migrate
rails db:seed

Start the Rails server:
bashCopyrails server

Visit http://localhost:3000 in your browser

Default Login Credentials
A default user is created during seeding:

Email: name@example.com
Password: password

Implementation Details
Backend (Ruby on Rails)

Models: Article, Category, Tag, User, and ArticleTag (join table)
Controllers: Articles, Categories, Tags, Sessions, and Users
Authentication: Using bcrypt for password hashing
Database: SQLite for simplicity

Frontend

Vue.js: Used for the article filtering system on the homepage
CSS Framework: Tailwind CSS for responsive styling
Responsive Design: Mobile-first approach with responsive breakpoints

Project Structure

app/models/ - Database models and relationships
app/controllers/ - Application controllers
app/views/ - ERB templates
app/javascript/components/ - Vue.js components
db/ - Database migrations and seed file


* Deployment instructions

* ...

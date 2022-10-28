# NAGANO CAKE

## ロゴ
![チームトマト【ロゴ】](https://user-images.githubusercontent.com/111132750/198517685-0da186ad-0afe-411e-93eb-6d6dbb4fc00f.png)

## 概要
長野県にあるチョコレート専門洋菓子店「ながのCAKE」のECサイトです。
![TOP画面](https://user-images.githubusercontent.com/111132750/198517723-a652bd36-6f99-4b49-95b1-8cb51a90e235.jpg)

## 使用方法
$ git clone git@github.com:team-Tomato-N/NAGANO_cake.git  
$ bundle install  
$ rails db:seed  
$ rails s  

**管理者用**  
メールアドレス:admin@webcamp.jp  
パスワード:password  
管理者用ログインURL: /admin/sign_in  


## 開発環境
Cloud9

### バックエンド
* ruby 3.1.2
* Rails 6.1.7
* SQLite3

### フロントエンド
* HTML
* SCSS

### その他
* bootstrap
* Font Awesome
* devise
* enum-help
* ActiveStorage

### ER図
![ER図](https://user-images.githubusercontent.com/111132750/198517735-ac958644-65ff-4515-9cbb-8dd00483a9ca.jpg)

## 主な機能

【顧客側】
* 会員登録、ログイン・ログアウト、退会機能
* アカウント情報管理機能
* 商品の注文機能
* 注文履歴の管理機能
* 配送先の管理機能

【管理者側】
* ログイン、ログアウト機能
* 商品の新規追加、編集、閲覧機能
* 販売停止機能
* 会員登録されている顧客情報の閲覧、編集、退会処理機能
* 注文ステータスの更新、製作ステータスの更新機能

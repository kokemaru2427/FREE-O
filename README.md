# README
・アプリ名						
・概要(このアプリでできることを書いて下さい)						
・本番環境(デプロイ先 テストアカウント＆ID)						
・制作背景(意図)						
⇒どんな課題や不便なことを解決するためにこのアプリを作ったのか。						
・DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)						
⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。						
・工夫したポイント						
・使用技術(開発環境)						
・課題や今後実装したい機能						
・DB設計						

# アプリ名

近大 Events

近畿大学生同士でのイベントやボランティア活動など新しいコミュニティを構築することのできるアプリです。

# DEMO

<img width="1295" alt="スクリーンショット 2021-03-17 18 08 24" src="https://user-images.githubusercontent.com/73264611/111442503-c6a60c80-874b-11eb-8a85-76a6ab98c613.png">

# 開発環境

- フロントエンド：HTML&CSS / JavaScript / Bootstrap
- バックエンド：Ruby / Ruby on Rails
- 単体テスト・結合テスト：RSpec
- インフラ：AWS（EC2 / S3）
- テキストエディタ：Visual Studio Code

# URL

[アプリ](http://13.114.223.16/)

# ログイン方法

ヘッダー右側のゲストログインボタンから、挙動確認用にゲストユーザーとしてログインすることができます
ゲストユーザーは、ユーザー情報の編集機能を除き、アプリの全機能を使用することができます
また、アプリユーザーは、新規登録ボタンからユーザー登録することでアプリの全機能を使用することができます

<img width="1440" alt="スクリーンショット 2021-03-17 18 20 34" src="https://user-images.githubusercontent.com/73264611/111445037-55b42400-874e-11eb-9f40-4c88c7de31d6.png">

# 概要

近畿大学の学生間で、イベントを主催できるアプリです。
同じ趣味を持った学生、新たなプロジェクトを作り出したい学生が
イベントを主催し、募集することで新たな学生同士の出会いやコミュニティを広げることができるアプリです。
また、このアプリをしようすることで、新入生サークル歓迎活動を効率的でより良いものとします。


# 制作背景

①新しい出会いがない。＝ 新しい知識や経験ができない。

私は近畿大学の学生です。
近畿大学には３万人以上の学生がいます。
しかし、その中で関わりのある人は、サークル活動の仲間や、同じ学部の同じ学科の同じ授業を受けている人に限定されています。そのため、学年が上がって行ったとしても新しい出会いはなく、一定の人達としか関わることができません。
また、私はアカペラサークルに所属していますが、自分の趣味であるバスケットボールを誰かとやりたいと考えた場合に、サークル内ではバスケットボールが好きな人はほとんどおらず、実際に活動を行えませんでした。
その他にも大学生の内にコミュニティーを運営したいと考えたり、プロジェクトを成功させる経験がしたいと考えましたが、同じ志の友達は限られておりプロジェクトを行えませんでした。

②新入生サークル歓迎活動が大変。

毎年4月に近大では自分のサークルに新入生を入れるため、サークルビラ配りが行われます。しかし、労力や時間、チラシのコストがかかります。
反対に新入生側も、チラシをもらえなかったり、どのようなサークルがあるのかわからずほとんどのサークルの存在を知らずにサークルを選ぶしかありません。
私の友達にも、いくつかのサークルはみたが自分に会うサークルが見つけられなかった。とサークルに参加せず、悔やんでいる人や、入ったがミスマッチが起こりすぐに辞めた人が多くいます。

上記二点の問題を踏まえて私は、今回のKindai Eventsを制作することを決めました。


目的のターゲット層

近畿大学生

どんなニーズ&課題に

- 大学は思ってたより人との関わりが少ない。
- 友達を増やしたい。
- 大学生の間にプロジェクトを作り上げる経験がしたい。
- 新規事業や自分の趣味活動を仲間としたいがリンクする人がいない。
- サークルの新入生歓迎活動において
①サークル員側
チラシ配りに時間や労力が取られる。
チラシ作りに費用がかかる。
チラシ配りでは一部の学生にしか配ることができない（受け取ってもらえない）
②新入生側
興味があるサークルのチラシ配りに遭遇しないとチラシがもらえない。
チラシを受け取りにくい（恥ずかしい、ゴミになる、友達の目が気になる）
もっと多くのサークル活動を一度にみたい。
自分が興味のある趣味や活動のサークルを一覧で見たい。
多くのサークル体験がしたい。


# 実装機能一覧
ユーザー管理機能（新規登録・ログイン）/ ユーザー登録情報編集機能 / ユーザー詳細ページ機能
イベント投稿機能 / イベント一覧表示機能 / イベント詳細表示機能  / イベント編集・削除機能 / イベントエントリー機能
コメント機能 / 画像投稿機能 / イベント検索機能 / イベント並び替え機能 /
いいね機能 / フォロー機能 / DM機能 / DM通知機能 / ゲストログイン機能 / レスポンシブデザイン

# 工夫したポイント

学生が新規登録を行いやすいように考えたデザイン。

# 使用技術(開発環境)

- Ruby on Rails
- HTML&CSS 
- JavaScript 
- Bootstrap
- Ruby
- RSpec
- AWS（EC2 / S3）
- Visual Studio Code
- Github

# 課題や今後実装したい機能


# DB設計

# Kindai-EventsのER図


## users テーブル

| Column             | Type        | Options     |
|:------------------:|:-----------:|:-----------:|
| nickname           | string      | null: false |
| email              | string      | null: false , unique:true|
| encrypted_password | string      | null: false |
| school_year        | string      | null: false |
| undergraduate      | string      | null: false |
| student_nunber     | string      | null: false |
| profile            | text        | ----------- |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column              | Type        | Options           |
|:-------------------:|:-----------:|:-----------------:|
| name                | string      | null: false       |
| explanation         | text        | null: false       |
| category_id         | integer     | null: false       |
| state_id            | integer     | null: false       |
| shipping_charge_id  | integer     | null: false       |
| prefecture_id       | integer     | null: false       |
| shipping_date_id    | integer     | null: false       |
| price               | integer     | null: false       |
| user                | references  | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column         | Type       | Options           |
|:--------------:|:----------:|:-----------------:|
| user           | references | foreign_key: true |
| item           | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options           |
|:--------------:|:----------:|:-----------------:|
| postal_code    | string     | null: false       |
| prefecture_id  | integer    | null: false       |
| municipalities | string     | null: false       |
| residence      | string     | null: false       |
| building       | string     | -----------       |
| phone_number   | string     | null: false       |
| purchase       | references | foreign_key: true |

### Association

- belongs_to :purchase

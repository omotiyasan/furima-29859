# README
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| realname | string | null: false |
| birthday | string | null: false |

### Association

- has_many :products
- has_many :buys

## products テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| money         | string | null: false |
| product       | references | null: false, foreign_key: true |
| category      | string | null: false |
| sales_area    | string | null: false |
| user          | references | null: false, foreign_key: true |

### Association

- has_many :buys
- belongs_to :user


## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| text   | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :product

## deliverys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | string     |                                |

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

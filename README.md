# README
# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| nickname             | string | null: false |
| familyname           | string | null: false |
| name_furigana        | string | null: false |
| familyname_furigana  | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :products
- has_many :buys

## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| money              | integer    | null: false                    |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| category_id        | integer    | null: false                    |
| sales_area_id      | integer    | null: false                    |
| shippingcharge_id  | integer    | null: false                    |
| daytoship_id       | integer    | null: false                    |
| condition_id       | integer    | null: false                    |

### Association

- has_one :buys
- belongs_to :user


## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :delivery

## deliverys テーブル

| Column           | Type        | Options                      |
| ---------------- | ----------- | ---------------------------- |
| postalcode       | string      | null: false                  |
| prefectures_id   | integer     | null: false                  |
| municipality     | string      | null: false                  |
| block            | string      | null: false                  |
| building         | string      | -----------------------------|
| phone            | string      | null: false                  |
| buy              | references  | null: false foreign_key: true|

### Association

- belongs_to:buy

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

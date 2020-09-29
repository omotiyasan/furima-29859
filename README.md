# README
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| familyname | string | null: false |

### Association

- has_many :products
- has_many :buys

## products テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| money         | string | null: false |
| productname   | string | null: false |
| productdescription   | string | null: false |
| user          | references | null: false, foreign_key: true |

### Association

- has_many :buys
- belongs_to :user


## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| text   | string     | null: false                    |
| cardnumber    | string | null: false |
| expirationdate    | string | null: false |
| securitycode    | string | null: false |

### Association

- belongs_to :user
- belongs_to :product
- has_one :delivery

## deliverys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | string     |  null: false |
| postalcode   | string | null: false |
| prefectures   | string | null: false |
| municipality    | string | --------- |
| building    | string | ----------|
| phone   | string | null: false |

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

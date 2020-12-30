# README

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

# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name(kanji)    | string | null: false               |
| last_name(kanji)     | string | null: false               |
| first_name(katakana) | string | null: false               |
| last_name(katakana)  | string | null: false               |
| birthday             | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| name             | string        | null: false                    |
| price            | integer       | null: false                    |
| description      | text          | null: false                    |
| user             | references    | null: false, foreign_key: true |
| category_id      | integer       | null: false                    |
| condition_id     | integer       | null: false                    |
| shipping_cost_id | integer       | null: false                    |
| shipping_area_id | integer       | null: false                    |
| days_to_ship_id  | integer       | null: false                    |

### Association

- has_one       :order
- belongs_to    :user

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| order          | references | null: false, foreign_key: true |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| house_num      | string     | null: false                    |
| building_name  | string     |                                |
| phone_num      | string     | null: false                    |

### Association

- belongs_to :order


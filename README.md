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

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| nickname   | string | null: false               |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| first_name | string | null: false               |
| last_name  | string | null: false               |
| birthday   | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| name          | string        | null: false                    |
| price         | text          | null: false                    |
| image         | ActiveStorage |                                |
| user          | references    | null: false, foreign_key: true |
| category      | ActiveHash    |                                |
| condition     | ActiveHash    |                                |
| shipping_cost | ActiveHash    |                                |
| shipping_area | ActiveHash    |                                |
| days_to_ship  | ActiveHash    |                                |

### Association

- has_many   :purchases
- has_one    :user

## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchase      | references | null: false, foreign_key: true |
| postal_code   | integer    | null: false                    |
| prefectures   | ActiveHash |                                |
| municipality  | string     | null: false                    |
| house_num     | string     | null: false                    |
| building_name | string     |                                |
| phone_num     | integer    | null: false                    |

### Association

- belongs_to :purchase


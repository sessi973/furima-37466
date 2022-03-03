# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last-name          | string  | null: false               |
| first-name         | string  | null: false               |
| last-name-kana     | string  | null: false               |
| first-name-kana    | string  | null: false               |
| birth-date         | datetime| null: false               |


### Association

- has_many :items_users
- has_many :orders_users

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-name                | text       | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | string     | null: false                    |
| item-sales-status        | string     | null: false                    |
| item-shipping-fee-status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-scheduled-delivery  | string     | null: false                    |
| item-price               | integer    | null: false                    |
| add-tax-price            | integer    | null: false                    |
| profit                   | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |



### Association

- has_one    :orders_items
- belongs_to :user

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
_ has_one    :shared

## shared テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal-code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     | null: false                    |
| phone-number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

- has_one :order




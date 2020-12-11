 # テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| name_kana| string | null: false |
| email    | string | null: false |
| password | string | null: false |
| birthday | string | null: false |

##  Association

- has_many :items
- has_many :buys

## items テーブル

| Column         | Type       | Options                        |
| -------------  | ---------- | -----------------------------  |
| image          | string     | null: false                    |
| product_name   | string     | null: false                    |
| text           | string     | null: false                    |
| category       | string     | null: false                    |
| product_status | string     | null: false                    |
| burden         | string     | null: false                    |
| area           | string     | null: false                    |
| ship_day       | string     | null: false                    |
| price          | string     | null: false                    |
| buy_id         | references | null: false, foreign_key: true |
| user_id        | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one   :buy

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | string     | null: false,                   |
| user_id   | references | null: false, foreign_key: true |

### Association
- belong_to :item
- belong_to :user
- has_one   :ship_add

## ship_adds テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| street_add   | string     | null: false                    |
| phone_number | string     | null: false                    |

### Association

- belong_to :buy

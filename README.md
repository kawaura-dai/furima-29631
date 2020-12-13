 # テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| first_name         | string | null: false               |
| first_name_furi    | string | null: false               |
| last_name          | string | null: false               |
| last_name_furi     | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| nickname           | string | null: false               |
| birthday           | date   | null: false               |

##  Association

- has_many :items
- has_many :buys

## items テーブル

| Column            | Type       | Options                        |
| ----------------  | ---------- | -----------------------------  |
| product_name      | string     | null: false                    |
| text              | text       | null: false                    |
| category_id       | integer    | null: false                    |
| product_status_id | integer    | null: false                    |
| burden_id         | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| ship_day_id       | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one   :buy

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belong_to :item
- belong_to :user
- has_one   :ship_add

## ship_adds テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| building_name| string     | null: false                    |
| postal_code  | string     | null: false                    |
| street_add   | string     | null: false                    |
| phone_number | string     | null: false                    |
| buy          | references | null: false, foreign_key: true |
### Association

- belong_to :buy

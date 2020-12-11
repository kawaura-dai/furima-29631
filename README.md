 # テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

##  Association

- has_many :items
- has_many :buys

## items テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | -----------------------------  |
| image   | string     | null: false                    |
| text    | string     | null: false                    |
| buy_id  | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

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

## ship_adds テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| street_add | string     | null: false                    |

### Association

- belong_to :street_add

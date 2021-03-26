# README

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| image             | text       | null: false                    |
| item_name         | string     | null: false                    |
| description       | string     | null: false                    |
| category          | string     | null: false                    |
| condition         | string     | null: false                    |
| delivery_ setting | string     | null: false                    |
| shipment_area     | string     | null: false                    |
| shipping_days     | string     | null: false                    |
| price             | numeric    | null: false                    |
| users             | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :orders

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| users        | references | null: false, foreign_key: true |
| items        | references | null: false, foreign_key: true |
| phone_number | string     | null: false                    |
| addresses    | references | null: false, foreign_key: true |
| creditcard   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## creditcard テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| card_number     | string | null: false |
| expiration_date | string | null: false |
| security_code   | string | null: false |

### Association

- belongs_to :orders

## addresses テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| postal_code    | string | null: false |
| prefecture     | string | null: false |
| prototype      | string | null: false |
| city           | string | null: false |
| street_address | string | null: false |
| building_name  | string |             |

### Association

- belongs_to :orders
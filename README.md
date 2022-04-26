# テーブル設計

## users テーブル


| Column             | Type   | Options    |
| nickname           | string | null: false|
| email              | string | unique: true|
| encrypted_password | string | null: false|
| name_sei           | string | null: false|
| name_mei           | string | null: false|
| name_kana_sei      | string | null: false|
| name_kana_mei      | string | null: false|
| birthday           | date   | null: false|
### Association
 - has_many :items

## items テーブル

| Column            | Type    | Options    |
| name              | string  | null: false|
| explain           | text    | null: false|
| state_id          | integer | null: false|
| category_id       | integer | null: false|
| delivery_fee_id   | integer | null: false|
| region_id         | integer | null: false|
| shipping_day_id   | integer | null: false|
| price             | integer | null: false|
| seller            | references | null: false foreign_key: true |
### Association
- belongs_to :user 

## buys テーブル
| Column             | Type         | Options    |
| user               | references   | null: false foreign_key: true|
| item               | references   | null: false foreign_key: true |
### Association
- belongs_to :user

# adresses テーブル
| Column            | Type     | Options    |
| postal_code       | string   | null: false|
| prefecture_id     | integer  | null: false|
| municipalite      | string   | null: false|
| house_number      | string   | null: false|
| building          | string   | null: false|
| telephone_ number | string   | null: false|
- belongs_to :user

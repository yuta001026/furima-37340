# テーブル設計

## users テーブル


| Column             | Type   | Options    |
| nickname           | string | null: false|
| email              | string | unique: true null: false |
| encrypted_password | string | null: false|
| name_sei           | string | null: false|
| name_mei           | string | null: false|
| name_kana_sei      | string | null: false|
| name_kana_mei      | string | null: false|
| birthday           | date   | null: false|
### Association
 - has_many :items
 - has_many :buys

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
| user            | references | null: false foreign_key: true |
### Association
- belongs_to :user 


## buys テーブル
| Column             | Type         | Options    |
| user               | references   | null: false foreign_key: true|
| item               | references   | null: false foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

# addresses テーブル
| Column            | Type     | Options    |
| postal_code       | string   | null: false|
| region_id         | integer  | null: false|
| municipality      | string   | null: false|
| house_number      | string   | null: false|
| building          | string   |     |
| telephone_ number | string   | null: false|
| buy | references | null: false foreign_key: true |
- belongs_to :buy
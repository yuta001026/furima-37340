# テーブル設計

## users テーブル


| Column             | Type   | Options    |
| nickname           | string | null: false|
| email              | string | null: false|
| encrypted_password | string | null: false|
| name               | string | null: false|
| name_kana          | string | null: false|
| birthday           | integer| null: false|
### Association
 - has_many :items

## items テーブル

| Column             | Type   | Options    |
| name               | text | null: false|
| explain              | text | null: false|
| state             | integer | null: false|
| category          | integer | null: false|
| delivery_fee      | integer | null: false|
| region            | integer | null: false|
| days              | integer | null: false|
| price             | integer | null: false|
| seller             | text | null: false|
### Association
- belongs_to :user 

## buys テーブル
| Column             | Type   | Options    |
| buyer              | text   | null: false|
| address            | text   | null: false|
### Association
- belongs_to :user

# adresses テーブル
| Column             | Type   | Options    |
| postal_code        | text   | null: false|
| prefectures       | integer | null: false|
| municipalities    | text    | null: false|
| house_number      | text    | null: false|
| buildings         | text    | null: false|
| telephone_ number | text    | null: false|
- belongs_to :user

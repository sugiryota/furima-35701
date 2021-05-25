# テーブル設計

## users テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| nickname          | string     | null: false |
| email             | string     | null: false |
| password          | string     | null: false |
| family_name       | string     | null: false |
| first_name        | string     | null: false |
| family_name_kana  | string     | null: false |
| first_name_kana   | string     | null: false |
| birth_day         | integer    | null: false |
| adress            | references |             |


### Association

- has_many  :items
- has_many  :comments
- has_one   :adress
- has_one   :pay

## items テーブル

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| image               | string      | null: false |
| name                | string      | null: false | 
| text                | text        | null: false |
| price               | integer     | null: false |
| category_id         | integer     | null: false |
| item_condition_id   | integer     | null: false |
| deliverry_charge_id | integer     | null: false |
| area_id             | integer     | null: false |
| delivery_day_id     | integer     | null: false |
| user                | references  |             |

### Association

- belongs_to  :user
- has_many    :comments

## comments テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| text        | text       | null: false |
| user        | references |             |
| item        | references |             |

### Association

- belongs_to  :user
- belongs_to  :item

## adress テーブル

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| postal_code         | integer     | null: false |
| prefecture          | string      | null: false | 
| city                | string      | null: false |
| adress              | integer     | null: false |
| building_name       | string      | null: false |
| phone_number        | integer     | null: false |
| user                | references  |             |


### Association

- belongs_to  :user


## pay テーブル

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| custermer           | integer     | null: false |
| term                | integer     | null: false | 
| security            | integer     | null: false |
| user                | references  |             |


### Association

- belongs_to  :user






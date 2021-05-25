# テーブル設計

## users テーブル

| Column            | Type       | Options                 |
| ----------------- | ---------- | ----------------------- |
| nickname          | string     | null: false             |
| email             | string     | null: false,unique:true |
| encrypted_password| string     | null: false             |
| family_name       | string     | null: false             |
| first_name        | string     | null: false             |
| family_name_kana  | string     | null: false             |
| first_name_kana   | string     | null: false             |
| birth_day         | date       | null: false             |



### Association

- has_many  :items
- has_many  :comments
- has_one   :address
- has_one   :pay

## items テーブル

| Column              | Type        | Options         |
| ------------------- | ----------- | --------------- |
| name                | string      | null: false     | 
| text                | text        | null: false     |
| price               | integer     | null: false     |
| category_id         | integer     | null: false     |
| item_condition_id   | integer     | null: false     |
| delivery_charge_id  | integer      | null: false    |
| prefecture_id       | integer     | null: false     |
| delivery_day_id     | integer     | null: false     |  
| user                | references  |foreign_key:true |             |

### Association

- belongs_to  :user
- has_many    :comments
- has_one     :pay

## comments テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| text        | text       | null: false |
| user        | references |             |
| item        | references |             |

### Association

- belongs_to  :user
- belongs_to  :item

## address テーブル

| Column              | Type        | Options          |
| ------------------- | ----------- | ---------------- |
| postal_code         | integer     | null: false      |
| prefecture_id       | integer     | null: false      | 
| city                | string      | null: false      |
| address             | string      | null: false      |
| building_name       | string      |                  |
| phone_number        | string      | null: false      |
| pay                 | references  | foreign_key:true |


### Association

- belongs_to  :user
- has_one     :pay

## pay テーブル

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| items               | references  |             |


### Association

- belongs_to  :user
- has_one     :address
- belongs_to  :item






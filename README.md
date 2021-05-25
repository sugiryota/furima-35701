# テーブル設計

## users テーブル

| Column            | Type       | Options                 |
| ----------------- | ---------- | ----------------------- |
| nickname          | string     | null: false             |
| email             | string     | null: false,unique:true |
| encryped_password | string     | null: false             |
| family_name       | string     | null: false             |
| first_name        | string     | null: false             |
| family_name_kana  | string     | null: false             |
| first_name_kana   | string     | null: false             |
| birth_day         | date       | null: false             |



### Association

- has_many  :items
- has_many  :comments
- has_one   :adress
- has_one   :pay

## items テーブル

| Column              | Type        | Options         |
| ------------------- | ----------- | --------------- |
| name                | string      | null: false     | 
| text                | text        | null: false     |
| price               | integer     | null: false     |
| category_id         | integer     | null: false     |
| item_condition_id   | integer     | null: false     |
| delivery_charge_id  | integer      | null: false     |
| prefecture_id             | integer     | null: false     |
| delivery_day_id     | integer     | null: false     |  
| user                | references  |foreign_key:true |             |

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
| prefecture_id       | integer     | null: false | 
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
| items               | refernces   |             |


### Association

- belongs_to  :user






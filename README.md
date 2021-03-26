## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | unique: true |
| encrypted_password | string | null: false |
| myoji    | string | null: false |
| namae | string | null: false |
| myoji_kana | string | null: false |
| namae_kana | string | null: false |
| birthday | date     | null: false |

### Association　　

- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item_name   | string       | null: false |
| text        | text         | null: false |
| status_id   | string       | null: false |
| cost_id     | string       | null: false |
| area_id     | string       | null: false |
| category_id | string       | null: false |
| delivery_id | string     | null: false |
| price_id    | string       | null: false |
| user        | references   | foreign_key: true |

### Association

- belongs_to :user
- has_one :order 
 

## orders テーブル

| Column | Type       | Options         |
| ------ | ---------- | --------------- |
| user   | references | foreign_key: true  |
| item   | references | foreign_key: true  |


### Association

- belongs_to :user
- belongs_to :item
- has_many :address


## address テーブル

| Column | Type       | Options         |
| ------ | ---------- | --------------- |
| postal_code    | string    | null:false        |
| prefectural_id | string    | null:false        |
| city           | string    | null:false        |
| street         | string    | null:false        |
| building       | string    | null:false        |
| phone number   | string    | null:false        |
| order          | references| foreign_key: true |

### Association

- belongs_to :order




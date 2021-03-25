## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| kana_name | string | null: false |
| birthday | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item_name   | string       | null: false |
| text        | text         | null: false |
| item_status | string       | null: false |
| cost burden | string       | null: false |
| user_area   | string       | null: false |
| category    | string       | null: false |
| delivery_time | string     | null: false |
| price       | string       | null: false |
| user        | references   | foreign_key: true |

### Association

- belongs_to :user
- has_one :order 
 

## orders テーブル

| Column | Type       | Options         |
| ------ | ---------- | --------------- |
| user   | references | foreign_key: true  |
| item   | references | foreign_key: true  |
| address | references| foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item


## address テーブル

| Column | Type       | Options         |
| ------ | ---------- | --------------- |
| address        | string    | null:false        |
| phone number   | string    | null:false        |
| order          | references| foreign_key: true |

### Association

- belongs_to :order




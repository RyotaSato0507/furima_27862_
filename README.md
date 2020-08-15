# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false, unique: true, index: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :todo_lists
- has_many :user_evaluations
- has_many :seller_items, foreign_key: "seller_id",  class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_one :point
- has_one :sns_authentication, dependent: :destroy
- has_one :sending_destination, dependent: :destroy

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|trading_status|enum|null: false|
|size|references|null: false, foreign_key: true|
|preparation_day|references|null: false, foreign_key: true|
|item_image|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|deal_closed_date|timestamp|-|

### Association
- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :item_images, dependent: :destroy
- has_one :user_evaluation
- belongs_to :category
- belongs_to_active_hush :size
- belongs_to_active_hush :item_condition
- belongs_to_active_hush :postage_payer
- belongs_to_active_hush :preparation_day
- belongs_to_active_hush :postage_type
- belongs_to :brand
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|item_id|integer|foreign_key: true|
|seller_id|integer|foreign_key: true|

### Association
- belongs_to :user
- has_many :items

## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|-|
|phone_number|string|unique: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## user_evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|evaluation_id|references|null: false, foreign_key: true|
|review|text|null: false|

### Association
- belongs_to_active_hash :evaluation
- belongs_to :user
- belongs_to :user

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|string|null:false|

### Association
- has_many :user_evaluations 

## sns_authenticationsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false, unique: true|
|token|text|-|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## todo_listsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|list|text|null: false|

### Association
- belongs_to :user

## pointsターブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|points|integer|-|

### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comments|text|null: false|
|created_at|timestamp|null: false|

### Association
- belongs_to :user
- belongs_to :item

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key :true|  
|url|string|null: false|

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

### Association
-has_many :items

## trendsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|-|

### Association
- has_many :items

## item_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|item_condition|string|null: false|

### Association
- has_many :items

## postage_payersテーブル
|Column|Type|Options|
|------|----|-------|
|preparation_day|string|null: false|

### Association
- has_many :items

## preparation_daysテーブル
|Column|Type|Options|
|------|----|-------|
|postage_type|string|null: false|

### Association
- has_many :items

## postage_typeテーブル
|postage_type|string|null: false|

### Association
- has_many :items




<!-- This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->

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
- has_many :items, dependent: :destroy
- has_many :purchases

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user|references|null: false, foreign_key: true|
|postage_payer_id|integer|null: false|
|preparation_day_id|integer|null: false|
|postage_type_id|integer|null: false|
|item_condition_id|integer|null: false|
|category_id|integer|null: false|
|price|integer|null: false|
|introduction|text|null: false|

### Association
- has_one :purchase
- has_many :comments, dependent: :destroy
- has_many :item_images, dependent: :destroy
- belongs_to_active_hush :item_condition
- belongs_to_active_hush :postage_payer
- belongs_to_active_hush :preparation_day
- belongs_to_active_hush :postage_type
- belongs_to_active_hush :category
- belongs_to :brand
- belongs_to :user
- Gem :jp_prefecture

## purchasesテーブル
Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- has_one :sending_destination
- belongs_to :user
- belongs_to :item

## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|-|
|phone_number|string|unique: true|
|purchase|references|null: false, foreign_key: true|

### Association
- belongs_to :purchase

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key :true|  
|url|string|null: false|

### Association
- belongs_to :item






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

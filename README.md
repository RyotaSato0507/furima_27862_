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
- has_many :items
- has_one :sending_destination, dependent: :destroy
- has_one :purchase

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|deal_closed_date|timestamp|-|
|postage_payer|string|null: false, foreign_key: true|
|preparation_day|string|null: false ,foreign_key: true|
|postage_type|string|null: false, foreign_key: true|
|item＿condition|string|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|price|integer|null: false|
|introduction|text|null: false|
|item_images|references|null: false, foreign_key: true|

### Association
- has_many :comments, dependent: :destroy
- has_many :item_images, dependent: :destroy
- belongs_to_active_hush :item_condition
- belongs_to_active_hush :postage_payer
- belongs_to_active_hush :preparation_day
- belongs_to_active_hush :postage_type
- belongs_to :category
- belongs_to :brand
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :user
- Gem :jp_prefecture

## purchaseテーブル
Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|item_id|integer|foreign_key: true|

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
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :use
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

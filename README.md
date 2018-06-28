# DB design

## ER diagram(image)
https://cacoo.com/diagrams/6IJUA8gpARgsCE0O

## users

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|profile|text|
|image|string|

### Association
- has_many :projects
- has_many :send_messages
- has_many :user_payments
- has_many :payments, through: :user_payments
- has_many :likes
- has_many :projects, through: :likes
- has_many :comments
- has_many :projects, through: :comments


## send_messages

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|int|null: false|

### Association
- belongs_to :user


## comments

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|reference|
|project_id|reference|

### Association
- belongs_to :user
- belongs_to :project


## likes

|Column|Type|Options|
|------|----|-------|
|user_id|reference|
|project_id|reference|

### Association
- belongs_to :user
- belongs_to :project


## user_payments

|Column|Type|Options|
|------|----|-------|
|user_id|reference|
|payment_id|reference|

### Association
- belongs_to :user
- belongs_to :payment


## payments

|Column|Type|Options|
|------|----|-------|
|number|int|null: false|
|return_id|reference|

### Association
- belongs_to :return
- has_many :user_payments
- has_many :users, through: :user_payments


## projectsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index: true|
|content|text|null: false|
|limit|datetime|null: false, index: true|
|goal|int|null:false, index :true|
|type|string|

### Association
- has_many :likes
- has_many :users, through: :likes
- has_many :comments
- has_many :users, through: :comments
- has_many :project_content_tags
- has_many :content_tags, through: :project_content_tags
- has_many :project_area_tags
- has_many :area_tags, through: :project_area_tags
- has_many :project_images
- has_many :articles
- has_many :returns

## project_area_tags

|Column|Type|Options|
|------|----|-------|
|area_tags_id|reference|foreign_key: true|
|project_id|reference|foreign_key: true |

### Association
- belongs_to :project
- belongs_to :area_tags


## content_tags

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,  index: true|

### Association
- has_many :project_contet_tags
- has_many :projects, througj: :project_content_tags


## project_content_tags

|Column|Type|Options|
|------|----|-------|
|project_id|reference|foreign_key: true|
|content_tags_id|reference|foreign_key: true |

### Association
- belongs_to :project
- belongs_to :content_tag

## articlesテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false, index: true|

### Association
- has_many :article_images
- belongs_to :projects


## project_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|

### Association
- belongs_to : projects

## returnsテーブル

|Column|Type|Options|
|------|----|-------|
|type|string|null: false|
|price|string|null: false|
|project_id|reference|foreign_key: true|

### Association
- has_many :return_images
- belongs_to :projects
- has_many :payments


## return_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|
|return_id|reference|foreign_key: true|

### Association
- belongs_to :return

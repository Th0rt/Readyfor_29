# DB design

## ER diagram(image)
https://cacoo.com/diagrams/6IJUA8gpARgsCE0O

-------------------------------------------------------

## users

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|email|string|
|password|string|
|profile|text|
|image|string|

### Association
- has_many :projects
- has_many :messages
- has_many :user_returns
- has_many :returns, through: :user_returns
- has_many :likes
- has_many :projects, through: :likes
- has_many :comments
- has_many :projects, through: :comments

-------------------------------------------------------

## messages

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|send_user_id|int|null: false|
|receive_user_id|int|null: false|

### Association
- belongs_to :user

-------------------------------------------------------

## comments

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|reference|foreign_key: true|
|project_id|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :project

-------------------------------------------------------

## likes

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|project_id|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :project

-------------------------------------------------------

## user_returns

|Column|Type|Options|
|------|----|-------|
|count|int|null: false|
|return_id|reference|foreign_key: true|
|user_id|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :return

-------------------------------------------------------

## projects

|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index: true|
|content|text|null: false|
|limit_date|datetime|null: false, index: true|
|goal|int|null:false, index :true|
|next_goal|int
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

-------------------------------------------------------

## project_area_tags

|Column|Type|Options|
|------|----|-------|
|project_id|reference|foreign_key: true |
|area_tag_id|reference|foreign_key: true|

### Association
- belongs_to :project
- belongs_to :area_tags

-------------------------------------------------------

## area_tags

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :project_area_tags

-------------------------------------------------------

## content_tags

|Column|Type|Options|
|------|----|-------|
|name|string|null: false,  index: true|

### Association
- has_many :project_contet_tags
- has_many :projects, through: :project_content_tags

-------------------------------------------------------

## project_content_tags

|Column|Type|Options|
|------|----|-------|
|project_id|reference|foreign_key: true|
|content_tags_id|reference|foreign_key: true |

### Association
- belongs_to :project
- belongs_to :content_tag

-------------------------------------------------------

## articles

|Column|Type|Options|
|------|----|-------|
|content|text|null: false, index: true|

### Association
- has_many :article_images
- belongs_to :projects

-------------------------------------------------------

## article_images

|Column|Type|Options|
|------|----|-------|
|image|string|
|article_id|reference|foreign_key: true|

### Association
- belongs_to :article

-------------------------------------------------------

## project_images

|Column|Type|Options|
|------|----|-------|
|image|string|
|project_id|reference|foreign_key: true

### Association
- belongs_to : projects

-------------------------------------------------------

## returns

|Column|Type|Options|
|------|----|-------|
|type|string|null: false|
|price|string|null: false|
|stock|int|
|content|text|null: false|
|arrival_date|datetime|foreign_key: true|
|project_id|reference|foreign_key: true|

### Association
- has_many :return_images
- belongs_to :projects
- has_many :user_returns
- has_many :users, througj: :user_returns

-------------------------------------------------------

## return_images

|Column|Type|Options|
|------|----|-------|
|image|string|
|return_id|reference|foreign_key: true|

### Association
- belongs_to :return

## projectsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index:|
|content|text|null: false|
|limit|datetime|null :false|
|goal|int|null:false|
|type|string|
|area|string|null:false|

### Association
- has_many :likes
- has_many :users, through: :likes
- has_many :comments
- has_many :users, through: :comments
- has_many :project_tags
- has_many :tags, through: :project_tags
- has_many :project_images
- has_many :articles
- has_many :returns


## project_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|project_id| reference |foreign_key :true|
|tag_id|reference|foreign_key :true|

### Association

- belongs_to :projects
- belongs_to :tags


## tagsテーブル

|Column|Type|Options|
|------|----|-------|
|content_tag_id|string|
|area_tag_id|string|


### Association
- has_many :content_tags
- has_many :area_tags

## content_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- belongs_to :tag


## area_tagsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- belongs_to :tag


## articlesテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|

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
|type|string|null: false, unique: true, index: true|
|price|string|null: false
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
- has_many :members
- has_many :groups, through: :members
- has_many :messages

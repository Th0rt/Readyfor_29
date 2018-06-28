## projectsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index: true|
|content|text|null: false|
|limit|datetime|null: false, index: true|
|goal|int|null:false, index :true|
|type|string|
|area|string|null:false|

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

##areas_tags

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :project_area_tags
- has_many  :projects , through: :project_area_tags


##project_area_tags

|Column|Type|Options|
|------|----|-------|
|area_tags_id|reference|foreign_key: true|
|project_id|reference|foreign_key: true |

### Association
- belongs_to :project
- belongs_to :area_tags


##content_tags
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,  index: true|

### Association
- has_many :project_contet_tags
- has_many :projects, througj: :project_content_tags

##project_content_tags

|Column|Type|Options|
|------|----|-------|
|project_id|reference|foreign_key: true|
|content_tags_id|reference|foreign_key: true |

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
- has_many :members
- has_many :groups, through: :members
- has_many :messages

# DB design

## ER diagram(image)
https://cacoo.com/diagrams/6IJUA8gpARgsCE0O
## HP
https://readyfor.jp/

-------------------------------------------------------

## users

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false, unique: true|
|password|string|null: false|
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

#####  ユーザー間のメッセージ送信機能
## messages


|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|send_user_id|int|null: false|
|receive_user_id|int|null: false|

### Association
- belongs_to :user

-------------------------------------------------------

##### プロジェクトページでコメントを行う機能
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

#####  ユーザーが各プロジェクトに対してお気に入りをする機能
## likes

|Column|Type|Options|
|------|----|-------|
|user_id|reference|foreign_key: true|
|project_id|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :project

-------------------------------------------------------

#####  プロジェクトへの寄付の内容　複数の金額設定ができる
## returns


|Column|Type|Options|
|------|----|-------|
|type|string|null: false|
|price|int|null: false|
|stock|int|
|content|text|null: false|
|arrival_date|datetime|
|image|string|null: false|
|project_id|reference|foreign_key: true|

### Association
- has_many :return_images
- has_many :user_returns
- has_many :users, through: :user_returns
- belongs_to :project

-------------------------------------------------------

#####  ユーザーとリターンを結ぶ中間テーブル
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

#####  投稿内容
## projects

|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index: true|
|content|text|null: false|
|limit_date|datetime|null: false, index: true|
|goal|int|null:false, index :true|
|next_goal|int|
|type|string|null: false|
|image|string|null: false|
|like_count|int|null: false|


### 　Association
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

#####  areaタグとprojectの中間テーブル
## project_area_tags

|Column|Type|Options|
|------|----|-------|
|project_id|reference|foreign_key: true |
|area_tag_id|reference|foreign_key: true|

### Association
- belongs_to :project
- belongs_to :area_tag

-------------------------------------------------------

#####  都道府県、国名などのプロジェクトにつけるタグ
## area_tags

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :project_area_tags

-------------------------------------------------------

#####  上記以外のタグ
## content_tags

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :project_content_tags
- has_many :projects, through: :project_content_tags

-------------------------------------------------------

#####  コンテンツタグとプロジェクトの中間テーブル
## project_content_tags


|Column|Type|Options|
|------|----|-------|
|project_id|reference|foreign_key: true|
|content_tag_id|reference|foreign_key: true |

### Association
- belongs_to :project
- belongs_to :content_tag

-------------------------------------------------------

#####  プロジェクトの所有者が投稿できる記事（ブログのような機能）
## articles

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|

### Association
- has_many :article_images
- belongs_to :project

-------------------------------------------------------

######  上記の記事に添付する画像（複数の画像を添付できる）
## article_images　

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|article_id|reference|foreign_key: true|

### Association
- belongs_to :article



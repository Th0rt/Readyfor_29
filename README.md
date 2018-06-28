# DB設計

## ER diagram
https://cacoo.com/diagrams/6IJUA8gpARgsCE0O

## users

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|profile|string|
|image|string|

### Association
- has_many :projects
- has_many :user_payments
- has_many :send_messages
- has_many :likes
- has_many :comments

------------------------------------------

## send_messages

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|int|null: false|

### Association
- belongs_to :user

------------------------------------------

## comments

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|reference|
|project_id|reference|

### Association
- belongs_to :user
- belongs_to :project

------------------------------------------

## likes

|Column|Type|Options|
|------|----|-------|
|user_id|reference|
|project_id|reference|

### Association
- belongs_to :user
- belongs_to :project

------------------------------------------

## user_payments

|Column|Type|Options|
|------|----|-------|
|user_id|reference|
|payment_id|reference|

### Association
- belongs_to :user
- belongs_to :payment

------------------------------------------

## payments

|Column|Type|Options|
|------|----|-------|
|number|int|null: false|
|return_id|reference|

### Association
- has_many :user_payments
- belongs_to :return

------------------------------------------
<!-- - has_many :groups, through: :members -->

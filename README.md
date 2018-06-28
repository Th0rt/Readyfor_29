# DB design

## ER diagram(image)
https://cacoo.com/diagrams/6IJUA8gpARgsCE0O

## users

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|profile|string|
|image|string|

### Association
- has_many :projects
- has_many :send_messages
- has_many :comments
- has_many :user_payments
- has_many :likes
- has_many :payments, through: :user_payments
- has_many :projects, through: :likes
- has_many :projects, through: :comments

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
- belongs_to :return
- has_many :user_payments
- has_many :users, through: :user_payments

------------------------------------------

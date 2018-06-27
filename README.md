# DB設計

## ER diagram
https://cacoo.com/diagrams/6IJUA8gpARgsCE0O

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|profile|string|
|image|string|

### Association
- has_many :members
- has_many :groups, through: :members
- has_many :messages

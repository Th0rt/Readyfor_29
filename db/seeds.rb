# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# テストユーザー
user = User.new(
  nickname: 'test-user',
  email:    'test@gmail.com',
  password: '123456')
user.save! if user.valid?

initial_cateogry = %w(社会にいいこと 地域 ものづくり アート チャレンジ)

initial_cateogry.each do |category|
  Category.create(name: category)
end

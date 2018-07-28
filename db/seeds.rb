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

# タグ
initial_tag_lists = [
  { category_name: '社会にいいこと',
    tag_name:      %w(子供・教育 国際教育 医療・福祉 環境保護 人権 マイノリティ 動物 発展途上国)
  },
  { category_name: '社会にいいこと',
    tag_name:      %w(地域文化 観光 まちづくり 災害 フード 特産品 地震 台風 歴史 飲食店)
  },
  { category_name: 'ものづくり',
    tag_name:      %w(ガジェット テクノロジ web・アプリ IoT ゲーム)
  },
  { category_name: 'アート',
    tag_name:      %w(音楽 本・漫画・写真 伝統文化 絵画・イラスト 映画・映像 ファッション 舞台・パフォーマンス)
  },
  { category_name: 'チャレンジ',
    tag_name:      %w(スポーツ 起業・スタートアップ 旅 大学)
  }
]


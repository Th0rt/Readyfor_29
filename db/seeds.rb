# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テストユーザー
for i in 1..3 do
  user = User.new(
    nickname: "test-user#{i}",
    email:    "test#{i}@gmail.com",
    password: '123456'
  )
  user.save! if user.valid?
end

# テストプロジェクト
for i in 1..10 do
  project = User.find(1).projects.new(
    title:        "test_project#{i}",
    content:      "text_project",
    projectimage: File.open("./app/assets/images/sample.png"),
    limit_date:   Date.today + 10,
    goal:         100000,
    next_goal:    150000,
    project_type: "purchase",
    likes_count:  0,
  )
  for i2 in 1..3 do
    project.returns.new(
      title:        "return#{i2}",
      price:        1000 * i2,
      stock:        0,
      content:      "test-return",
      arrival_date: Date.today + 30 * i2
    )
  end
  project.save!
end

# カテゴリ
initial_cateogry = %w(社会にいいこと 地域 ものづくり アート チャレンジ)

initial_cateogry.each do |category|
  Category.create(name: category)
end

# タグ
initial_tag_lists = [
  { category_name: '社会にいいこと',
    tag_name:      %w(子供・教育 国際教育 医療・福祉 環境保護 人権 マイノリティ 動物 発展途上国)
  },
  { category_name: '地域',
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

initial_tag_lists.each do |tag_list|
  category = Category.find_by(name: tag_list[:category_name])
  tag_list[:tag_name].each do |tag_name|
    tag = category.tags.create(name: tag_name, type: '')
  end
end

# 地域
intial_region = %w(
  北海道 札幌 旭川 知床
  東北 青森県 岩手県 宮城県 秋田県 山形県 福島県
  関東 茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県
  中部 新潟県 富山県 石川県 福井県 山梨県 長野県 岐阜県 静岡県 愛知県
  近畿 三重県 滋賀県 京都府 大阪府 兵庫県 奈良県 和歌山県
  中国 鳥取県 島根県 岡山県 広島県 山口県
  四国 徳島県 香川県 愛媛県 高知県
  九州 福岡県 佐賀県 長崎県 熊本県 大分県 宮崎県 鹿児島県
  沖縄
  海外 アジア オセアニア 北米・中米 中近東 ヨーロッパ 南米 アフリカ
)

intial_region.each do |region|
  Region.create(name: region)
end


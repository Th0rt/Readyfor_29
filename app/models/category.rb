class Category < Tag
  validates :name, presence: true, uniqueness: true

  has_many :projects

  has_many :tag_categories
  has_many :tags, through: :tag_categories
end

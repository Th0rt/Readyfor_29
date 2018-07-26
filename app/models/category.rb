class Category < Tag
  validates :name, presence: true, uniqueness: true

  has_many :tag_categories, dependent: :destroy
  has_many :tags, through: :tag_categories
end

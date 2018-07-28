class Region < Tag
  validates :name, presence: true, uniqueness: true
end

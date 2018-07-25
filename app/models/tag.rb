class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :tag_projects, dependent: :destroy
  has_many :projects, through: :tag_projects

  has_one :tag_category
  has_one :category, through: :tag_category
end

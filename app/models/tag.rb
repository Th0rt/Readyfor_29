class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :tag_projects
  has_many :projects, through: :tag_projects
end

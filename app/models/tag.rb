class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :tag_projects, dependent: :destroy
  has_many :projects, through: :tag_projects
end

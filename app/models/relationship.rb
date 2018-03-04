class Relationship < ApplicationRecord
  has_many :graves

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug
end

class Relationship < ApplicationRecord
  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug
end

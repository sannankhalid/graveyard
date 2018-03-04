class Grave < ApplicationRecord
  has_one :attachment, as: :attachable, dependent: :destroy
  belongs_to :creator,class_name: 'User',foreign_key: 'created_by_id'
  belongs_to :updater,class_name: 'User',foreign_key: 'updated_by_id'
  belongs_to :relationship

  accepts_nested_attributes_for :attachment,  allow_destroy: true

  validates_presence_of :name,  :relationship_name, :age, :died_at, :number
  validates_presence_of :relationship_id, message: 'Select Relationship Type'
  validates_presence_of :relationship_name, message: 'Select Relationship Name'
  # validates :gender, inclusion: { in: [:male, :female] }
  # enum gender: [male: 1, female: 2]


end

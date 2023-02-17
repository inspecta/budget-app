class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :entities_groups, dependent: :destroy
  has_many :groups, through: :entities_groups, dependent: :destroy

  # Valudation
  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

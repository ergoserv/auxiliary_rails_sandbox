class Book < ApplicationRecord
  attr_accessor :publisher_name

  belongs_to :publisher
  has_and_belongs_to_many :authors

  validates :title, presence: true
end

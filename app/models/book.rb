class Book < ApplicationRecord
  # scope :costly, -> { where("price > ?", 3000) }
  # socpe :writen_about, ->(theme) { where("name like ?", "%#{theme}%") }

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors
end

class Book < ApplicationRecord
  scope :costly, -> { where("price > ?", 3000) }
  socpe :writen_about, ->(theme) { where("name like ?", "%#{theme}%") }
end

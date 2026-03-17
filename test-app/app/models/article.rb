# all it takes to get a bare bone model to communicate with the database
# uda ada getter & setter juga
class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 6, maximum: 100} # harus ada judul baru bisa di-input
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  belongs_to :user
end
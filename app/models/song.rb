class Song < ActiveRecord::Base
  has_many :lists
  validates :artist, presence:true,  length: { minimum: 2 }
  validates :title, presence: true, length: { minimum: 2 }
end

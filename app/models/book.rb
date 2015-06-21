class Book < ActiveRecord::Base
  has_many :chapters
  validates_presence_of :title
end

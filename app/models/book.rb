class Book < ActiveRecord::Base
  versioned
  has_many :chapters
  validates_presence_of :title
  accepts_nested_attributes_for :chapters, 
    :reject_if => lambda { |chapter| chapter[:content].blank? }, 
    :allow_destroy => true
end

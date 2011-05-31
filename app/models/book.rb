class Book
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  embeds_many :chapters
  field :title, type: String
  field :tag,   type: String
  validates_presence_of :title
  accepts_nested_attributes_for :chapters, 
    :reject_if => lambda { |chapter| chapter[:content].blank? }, 
    :allow_destroy => true
end

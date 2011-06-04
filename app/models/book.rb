class Book
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  embeds_many :chapters
  field :title, type: String
  field :tag,   type: String
  validates_presence_of :title
end

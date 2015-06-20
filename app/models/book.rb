class Book
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  embeds_many :chapters, inverse_of: :book
  field :title, type: String
  field :tag,   type: String
  validates_presence_of :title
end

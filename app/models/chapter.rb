class Chapter
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  embedded_in :book, inverse_of: :chapters
  field :title, type: String
  embeds_many :sentences
end

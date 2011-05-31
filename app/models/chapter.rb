class Chapter
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  embedded_in :book
  field :title, type: String
end

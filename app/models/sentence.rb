class Sentence
  include Mongoid::Document
  include Mongoid::Versioning
  include Mongoid::Timestamps

  field :text, :type => String
  field :type, :type => String
  embedded_in :chapter
end

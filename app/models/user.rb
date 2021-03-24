class User < ApplicationRecord
  belongs_to :location
  has_and_belongs_to_many :tags
end

class User < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :squad, optional: true
  has_and_belongs_to_many :tags
  has_one_attached :image

  def self.roles
    User.distinct.pluck(:role)
  end
end

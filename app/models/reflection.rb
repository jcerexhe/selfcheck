class Reflection < ActiveRecord::Base
  belongs_to :user
  validates :entry_type, :feels, :body, presence: true

  geocoded_by :ip_address
  after_validation :geocode
end

class Profile < ApplicationRecord

  has_one :movie, as: :videoble

  accepts_nested_attributes_for :movie

end

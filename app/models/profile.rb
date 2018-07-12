class Profile < ApplicationRecord
  has_one :movie, as: :videoble
  belongs_to :user

  accepts_nested_attributes_for :movie
end

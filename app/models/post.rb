class Post < ApplicationRecord

  belongs_to :user

  has_one :movie, as: :videoble

  accepts_nested_attributes_for :movie

  has_many :evils

  has_many :eviling_users, through: :evils, source: :user


end

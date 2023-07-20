class Qualification < ApplicationRecord
  has_many :bags
  has_many :users, through: :bags

  has_many :packages
  has_many :subjects, through: :packages

end

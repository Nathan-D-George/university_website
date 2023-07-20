class Qualification < ApplicationRecord
  has_many :bags
  has_many :users, through: :bags

  has_many :packages, dependent: :destroy
  has_many :subjects, through: :packages, dependent: :destroy

end

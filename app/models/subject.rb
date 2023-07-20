class Subject < ApplicationRecord
  
  has_many :packages
  has_many :qualifications, through: :packages
end

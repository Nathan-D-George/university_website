class Subject < ApplicationRecord
  
  has_many :packages, dependent: :destroy
  has_many :qualifications, through: :packages, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end

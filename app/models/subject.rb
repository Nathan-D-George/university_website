class Subject < ApplicationRecord
  
  has_many :packages, dependent: :destroy
  has_many :qualifications, through: :packages, dependent: :destroy

  has_many :enlistments
  has_many :users, through: :enlistments

  has_many :assessments
  
  validates :name, presence: true, uniqueness: true
end

class Lesson < ApplicationRecord
  belongs_to :subject

  validates :name, uniqueness: true
  has_many_attached :attachments, dependent: :destroy 


end

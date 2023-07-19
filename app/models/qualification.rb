class Qualification < ApplicationRecord
  belongs_to :user

  #has_many_attached :attachments, dependent: :destroy


end

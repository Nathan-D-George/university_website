class Assessment < ApplicationRecord
  
  # belongs_to :subject
  
  has_many :marksboards
  has_many :users, through: :marksboards
  enum assess_type: %i[tutorial practical project A1 A2]
  
  # def self.mark_options
  #   ar = []
  #   for i in 0..99
  #     ar.append(100-i)
  #   end
  #   ar.to_a
  # end
end

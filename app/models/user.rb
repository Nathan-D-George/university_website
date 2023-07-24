class User < ApplicationRecord
  has_many :bags
  has_many :qualifications, through: :bags
  has_secure_password
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }

  has_many_attached :attachments, dependent: :destroy 
  
  #after_create_commit { assign_student_no }
  after_commit :assign_student_no# add_default_avatar, on: %i[create update]
  
  def self.mark_options
    ar = []
    for i in 0..99
      ar.append(100-i)
    end
    ar.to_a
  end

  private
  def assign_student_no
    self.student_no = User.last.student_no+1
  end
  
end

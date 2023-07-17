class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }

  #after_create_commit { assign_student_no }
  after_commit :assign_student_no# add_default_avatar, on: %i[create update]


  private
  def assign_student_no
    self.student_no = User.last.student_no+1
  end
  
end

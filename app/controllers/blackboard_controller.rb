class BlackboardController < ApplicationController
  DateTime.now.month < 7 ? $semester = 1 : $semester = 2
  def home

    if Current.user.nil?
      flash[:alert] = 'You are not logged in'
      redirect_to sign_in_path
    else
      url  = request.original_url
      urls = url.split('/')
      black_board = false
      urls.each{|piece| 
        black_board = true if piece == 'blackboard'
      }
      if Current.user.role == "student" 
        my_year = Current.user.year_of_study
        subs = Current.user.qualifications.last.subjects.where(year: my_year).all.where(semester: $semester)
        @subjects = []
        hash     = {}
        subs.each {|s| 
          hash[s] = 1, @subjects.append(s) if hash[s].nil?  && !Enlistment.where(subject_id: s.id, user_id: Current.user.id).first.blank?
        }
      elsif Current.user.role == "lecturer"
        subs = Subject.all
        @subjects = []
        hash      = {}
        subs.each {|s| 
          hash[s] = 1, @subjects.append(s) if hash[s].nil?  && s.lecturer == Current.user.student_no
        }
      else 
        @subjects = Subject.all
      end
    end
  end

end
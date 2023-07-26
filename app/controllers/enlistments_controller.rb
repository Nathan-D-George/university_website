class EnlistmentsController < ApplicationController
  before_action :only_lecturers_allowed

  def new
    @enlistment  = Enlistment.new
    @enlistments = students_enlisted(params[:id])
    @users       = students_only
    @subjects    = [Subject.find(params[:id].to_i).name]
    console
    
  end

  def create
    enlistment = Enlistment.new
    enlistment.user_id    = User.where(email: params[:enlistment][:student_email]).first.id
    enlistment.subject_id = Subject.where(name: params[:enlistment][:subject]).first.id
    enlistment_exists = already_exists?(enlistment.user_id, enlistment.subject_id)

    if !enlistment_exists
      if enlistment.save 
        flash[:notice] = 'Successfully enrolled student in course'
        redirect_to new_assessment_path
      else
        flash[:alert] = 'Error in enrolling student.'
        redirect_to new_assessment_path
      end
    else
      flash[:alert] = 'Enrollment may exist already.'
      redirect_to new_assessment_path
    end
  end

  def edit
    subject = Subject.where(name: params[:subject_name]).first
    @enlistment = Enlistment.where(user_id: params[:student_id].to_i, subject_id: subject.id).first
  end

  def destroy
    enlistment = Enlistment.find(params[:id])
    enlistment.destroy
    flash[:notice] = 'Successfully destroyed Enrollment'
    redirect_to blackboard_path
  end

  private
  def only_lecturers_allowed
    redirect_to blackboard_path, alert: 'Only Lecturers can do these things.' if Current.user.role != 1 || Current.user.nil?
  end

  def students_only
    users    = User.students.all
    students = []
    users.each {|user|
      students.append(user.email)
    }
    students
  end

  def subject_names
    subjects = Subject.all
    names    = []
    subjects.each {|subject|
      names.append(subject.name)
    }
    names
  end
  
  def already_exists?(user_id, subject_id)
    return false if Enlistment.where(user_id: user_id, subject_id: subject_id).first.nil?
    true
  end

  def students_enlisted(subject_id)
    enlistments = Enlistment.where(subject_id: subject_id).all
    students    = []
    enlistments.each {|enlistment|
      students.append(User.find(enlistment.user_id))
    }
    students.sort_by {|s| s.student_no}
  end

end
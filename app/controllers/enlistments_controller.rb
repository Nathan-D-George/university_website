class EnlistmentsController < ApplicationController
  before_action :only_lecturers_allowed

  def new
    are_you_the_real_lecturer(params[:id])
    @enlistment  = Enlistment.new
    @enlistments = students_enlisted(params[:id])
    @users       = students_only(params[:id])
    @subjects    = [Subject.find(params[:id].to_i).name]
  end

  def create
    enlistment = Enlistment.new
    array = params[:enlistment][:email].split('@')
    if array.last == "student.com"
      enlistment.user_id    = User.where(email: params[:enlistment][:email]).first.id
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
    else
      lecturer = User.where(email: params[:enlistment][:email]).first
      subject  = Subject.where(name: params[:enlistment][:subject]).first
      subject.lecturer = lecturer.student_no
      if subject.save
        flash[:notice] = "Successfully appointed #{lecturer.email} lecturer of #{subject.name}"
      else
        flash[:alert] = "Something went wrong with lecturer appointment"
      end
      redirect_to admin_page_path
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

  def add_lecturer
    redirect_to blackboard_path, alert: 'ADMINs only!' if Current.user.role != "ADMIN"
    @subjects       = Subject.all
    @subjects_names = subject_names
    @users          = lecturers_names
    @users.prepend("unassign")
    # @enlistment     = Enlistment.new
  end

  private

  def only_lecturers_allowed
    redirect_to blackboard_path, alert: 'Only Lecturers can do these things.' if Current.user.role == 0 || Current.user.nil?
  end

  def students_only(subject_id)
    subject  = Subject.find(subject_id) 
    users    = User.students.all
    students = []
    users.each {|user|
      students.append(user.email) if user.year_of_study >= subject.year
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

  def lecturers_names
    lecturers_names = []
    lecturers = User.where(role: "lecturer").all
    lecturers.each {|user| lecturers_names.append(user.email)}
    lecturers_names
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

  def are_you_the_real_lecturer(subject_id)
    return if Current.user.role = "ADMIN"
    subject = Subject.find(subject_id)
    redirect_to blackboard_path, alert: "Only this Subject's Lecturers can do these things." if Current.user.student_no != subject.lecturer
  end
end
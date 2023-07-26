class AssessmentsController < ApplicationController
  before_action :assign_temp_subject, only: [:new, :update]
  before_action :ensure_correct_lecturer
  $temp_subject    = nil
  $temp_assessment = nil
  
  def show
    @assessment = Assessment.find(params[:id])
  end

  def new
    @assessment   = Assessment.new
    $temp_subject = params[:id]
    @users = get_users_per_assessment(params[:id])
    @assessments = get_users_assessments_for_subject(params[:id].to_i)
  end
  
  def create
    @assessment = Assessment.new#(assessment_params)
    @assessment.name  = params[:assessment][:name]
    @assessment.mark  = params[:assessment][:mark]
    @assessment.total = params[:assessment][:total]
    num = Assessment.assess_types[params[:assessment][:assess_type]]
    @assessment.assess_type = num
    @assessment.subject_id  = $temp_subject
    if @assessment.save
      @marksboard = Marksboard.new
      @marksboard.user_id       = User.where(email: params[:assessment][:student]).first.id
      @marksboard.assessment_id = @assessment.id

      if @marksboard.save
        flash.now[:notice] = 'Successfully save Assessment'
        redirect_to new_assessment_path
      end
    else
      flash[:alert] = 'Something went Wrong'
      redirect_to new_assessment_path
    end
  end
  
  def edit
    @assessment      = Assessment.find(params[:id])
    $temp_assessment = params[:id]
    @assessments = get_users_assessments_for_subject(params[:id].to_i)
    console
  end

  def update
    @assessment = Assessment.find($temp_assessment)
    @assessment.name  = params[:assessment][:name]
    @assessment.mark  = params[:assessment][:mark]
    @assessment.total = params[:assessment][:total]
    if @assessment.save
      flash[:notice] = 'Assessment Successfully Updated'
      redirect_to new_assessment_path(id: @assessment.subject_id )
    else
      flash[:alert] = 'Problem with updating Assessment'
      redirect_to edit_assessment_path
    end 
  end

  def delete
    debugger
    @assessment = Assessment.find(params[:id])
    @assessment.destroy
    flash[:notice] = 'Successfully Deleted Assessment'
  end

  private

  def assessment_params
    params.require(:assessment).permit(:name, :mark, :total, :assess_type)
  end

  def ensure_student_enlistment
    return if Current.user.role != "student"
    subject = Subject.find($temp_subject)
    redirect_to blackboard_path, alert: 'You are not enrolled in this class yet.' if Enlistment.where(user_id: Current.user.id, subject_id: subject.id).first.blank?
  end

  def ensure_correct_lecturer
    return if Current.user.role = "ADMIN"
    redirect_to blackboard_path, alert: "Lecturers Only" if Current.user.role != 1
    subject = Subject.find($temp_subject)
    redirect_to blackboard_path, alert: "Only this Subject's Lecturers can do these things." if Current.user.student_no != subject.lecturer
  end

  def assign_temp_subject
    $temp_subject = params[:id].to_i
  end

  def get_users_per_assessment(subject_id)
    hash_users     = {}
    array_users    = []
    subject        = Subject.find(subject_id)
    qualifications = subject.qualifications.all
    qualifications.each {|qualification|
      qualification.users.each{|user|
        if user.year_of_study == subject.year
          hash_users[user.email] = 1, array_users.append(user.email) if hash_users[user.email].nil?
        end
      }
    }
    array_users
  end

  def get_users_assessments_for_subject(subject_id)
    marks = Marksboard.all
    array_assessments = []
    marks.each {|m|
      if Assessment.find(m.assessment_id).subject_id == subject_id
        array_assessments.append({assessment: Assessment.find(m.assessment_id), student: User.find(m.user_id)})
      end 
    }
    array_assessments
  end

end

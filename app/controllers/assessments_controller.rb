class AssessmentsController < ApplicationController
  before_action :only_lecturers_allowed
  $temp_subject = nil
  
  def show
    @assessment = Assessment.find(params[:id])
  end

  def new
    @assessment = Assessment.new
    $temp_subject = params[:id]
    @subject = Subject.find(params[:id].to_i)
    @users = get_users_per_assessment(params[:id])
    var = User.where(email: @users).first.qualifications.last.subjects.find($temp_subject)
    console
  end
  
  def create
    @assessment = Assessment.new#(assessment_params)
    @assessment.name  = params[:assessment][:name]
    @assessment.mark  = params[:assessment][:mark]
    @assessment.total = params[:assessment][:total]
    num = Assessment.assess_types[params[:assessment][:assess_type]]
    @assessment.assess_type = num
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
    debugger
    @assessment = Assessment.find_by(params[:id])
  end

  def update
    debugger
    # @assessment = Assessment.find_by()
    @assessment.name  = params[:assessment][:name]
    @assessment.mark  = params[:assessment][:mark]
    @assessment.total = params[:assessment][:total]
    if @assessment.save
      flash[:notice] = 'Assessment Successfully Updated'
      redirect_to list_lessons_path
    else
      flash[:alert] = 'Problem with updating Assessment'
      render :edit
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

  def only_lecturers_allowed
    redirect_to blackboard_path, alert: 'Only Lecturers can do these things!' if Current.user.role != 1
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
end
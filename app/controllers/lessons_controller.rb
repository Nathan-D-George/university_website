class LessonsController < ApplicationController
  $temp_subject = 11
  before_action :assign_temp_subject, except: [:create, :update, :secret]
  before_action :ensure_student_enlistment, only: [:list, :show]
  before_action :ensure_correct_lecturer, only: [:new, :edit]

  def list
    @subject = Subject.find(params[:id])
    @lessons_all = Lesson.where(subject_id: @subject.id).all.order(id: :desc)
    @lessons_vis = Lesson.where(subject_id: @subject.id, visible: true).all.order(id: :desc)
  end

  def show
    @lesson = Lesson.find(params[:id].to_i)
    redirect_to blackboard_path, alert: "This lesson is not Available Yet" if @lesson.visible != true && Current.user.role == 0
  end

  def new
    @lesson = Lesson.new(subject_id: params[:id].to_i)
    $temp_subject = params[:id].to_i
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.subject_id = $temp_subject
    $temp_subject = nil
    if @lesson.save
      flash[:notice] = 'Lesson Successfully Created'
      redirect_to list_lessons_path(id: @lesson.subject_id)
    else
      flash[:alert] = 'Something went wrong with lesson creation'
      render :new
    end

  end

  def edit
    @lesson = Lesson.find(params[:id].to_i)
    $temp_subject = params[:id].to_i
  end

  def update
    @lesson = Lesson.find($temp_subject)
    params[:lesson][:visible] == "true" ? @lesson.visible = true : @lesson.visible = false
    $temp_subject = nil
    if @lesson.save
      flash[:notice] = 'Lesson Successfully Updated'
      redirect_to show_lesson_path(id: @lesson.id)
    else
      flash[:alert] = 'Something went wrong with lesson editing'
      render :edit
    end
  end
  
  def secret
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :description, attachments: [])
  end

  def ensure_student_enlistment
    return if Current.user.role != "student" 
    subject = Subject.find($temp_subject)
    redirect_to blackboard_path, alert: 'You are not enrolled in this class yet.' if Enlistment.where(user_id: Current.user.id, subject_id: subject.id).first.blank?
  end

  def ensure_correct_lecturer
    return if Current.user.role = "ADMIN"
    redirect_to blackboard_path, alert: "Lecturers Only" if Current.user.role == "student"
    subject = Subject.find($temp_subject)
    redirect_to blackboard_path, alert: "Only this Subject's Lecturers can do these things." if Current.user.student_no != subject.lecturer && Current.user.role != "ADMIN"
  end

  def assign_temp_subject
    $temp_subject = params[:id].to_i
  end

end

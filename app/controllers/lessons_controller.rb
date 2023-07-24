class LessonsController < ApplicationController
  $temp_subject = nil
  def list
    @subject = Subject.find(params[:id])
    @lessons_all = Lesson.where(subject_id: @subject.id).all.order(id: :desc)
    @lessons_vis = Lesson.where(subject_id: @subject.id, visible: true).all.order(id: :desc)
  end

  def show
    @lesson = Lesson.find(params[:id].to_i)
    redirect_to blackboard_path, alert: "This lesson is not Available Yet" if @lesson.visible != true && Current.user.role != 1
  end

  def new
    redirect_to blackboard_path, alert: "Lecturers Only" if Current.user.role != 1
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
    redirect_to blackboard_path, alert: "Lecturers Only" if Current.user.role != 1
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
end

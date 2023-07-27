class SubjectsController < ApplicationController
  $edit_me = nil
  DateTime.now.month < 7 ? $semester = 1 : $semester = 2

  def new
    if Current.user.role == "student"
      flash[:alert] = 'This permission is reserved for lecturers'
      redirect_to blackboard_path
    else
      @subject = Subject.new
    end
  end

  def create
    @subject = Subject.new(sub_params)

    if @subject.save
      qual = 1 if !params[:subject][:EE].nil?
      Package.create(name:"Pack-EE#{@subject.id}}", subject_id: @subject.id, qualification_id: qual)
      qual = 2 if !params[:subject][:MC].nil?
      Package.create(name:"Pack-MC#{@subject.id}", subject_id: @subject.id, qualification_id: qual)
      qual = 3 if !params[:subject][:MM].nil?
      Package.create(name:"Pack-MM#{@subject.id}", subject_id: @subject.id, qualification_id: qual)
      qual = 4 if !params[:subject][:CE].nil?
      Package.create(name:"Pack-CE#{@subject.id}", subject_id: @subject.id, qualification_id: qual)
      flash[:notice] = 'Subject successfully generated'
      redirect_to list_subjects_path
    else
      flash[:alert] = 'Something went wrong. Try again later'
      redirect_to blackboard_path
    end
  end

  def edit
    @subject = Subject.find(params[:id].to_i)
    $edit_me = params[:id].to_i
  end
  
  def update

    @subject = Subject.find($edit_me)
    @subject.name = params[:subject][:name]
    @subject.credits  = params[:subject][:credits]
    @subject.semester = params[:subject][:semester]
    @subject.year     = params[:subject][:year]
    
    if @subject.save
      qual = 1 if !params[:subject][:EE].nil?
      Package.create(name:"Pack-EE#{@subject.id}}", subject_id: @subject.id, qualification_id: qual)
      qual = 2 if !params[:subject][:MC].nil?
      Package.create(name:"Pack-MC#{@subject.id}", subject_id: @subject.id, qualification_id: qual)
      qual = 3 if !params[:subject][:MM].nil?
      Package.create(name:"Pack-MM#{@subject.id}", subject_id: @subject.id, qualification_id: qual)
      qual = 4 if !params[:subject][:CE].nil?
      Package.create(name:"Pack-CE#{@subject.id}", subject_id: @subject.id, qualification_id: qual)
      flash[:notice] = 'Subject successfully generated'
    else
      flash[:alert] = 'Something went wrong. Try again later'
    end
    
    redirect_to blackboard_path
  end

  def list
    subjects = Subject.all
    @subjects_by_year = []
    years = [1,2,3,4]

    years.each{|y|
      oneYear = []
      group  = Subject.where(year: y).all
      group.each{|g| oneYear.append(g)}
      @subjects_by_year.append(oneYear)
    }
    @subjects_by_year 
  end

  def show
    @subject = Subject.find(params[:id].to_i)
    @quals   = []
    @hash    = {}
    @subject.qualifications.each {|q| 
      @hash[q] = 1, @quals.append(q.name) if @hash[q].nil?  
    }

  end

  def destroy
    if Current.user.role != 1
      flash[:alert] = 'This action is reserved for lecturers'
    else
      @subject = Subject.find(params[:id].to_i)
      @subject.destroy
      flash[:notice] = 'Subject Successfully Disposed Of :thumbs_up'
      redirect_to list_subjects_path
    end
  end

  def content
    @subject = Subject.find(params[:id])
  end

  private 
  def sub_params
    params.require(:subject).permit(:name, :credits, :semester, :year)
  end

end
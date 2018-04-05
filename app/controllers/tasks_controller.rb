class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @project = Project.find(params[:project_id])
  end

  def create
    task = Task.new(
      title: params[:title],
      description: params[:description],
      deadline: params[:deadline],
      project_id: params[:project_id]
    )
    if task.save
      flash[:success] = "Project Successfully Created"
      redirect_to "/projects/#{ task.project_id }"
    else
      render 'new.html.erb'
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    
    task.assign_attributes(
      title: params[:title],
      deadline: params[:deadline],
      project_id: task.project_id
      )
    
    if task.save
      flash[:success] = "Task Successfully Updated"
      redirect_to "/projects/#{ task.project_id }"
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    flash[:success] = "Task Successfully Deleted"
    redirect_to "/projects/#{ task.project_id }"
  end
end

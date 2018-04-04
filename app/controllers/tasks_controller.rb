class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(params[:task])
    task = Task.new(
      title: params[:title],
      description: params[:description],
      project_id: params[:project_id]
      )
    if task.save
      flash[:success] = "Project Successfully Created"
      redirect_to "/tasks/#{ @task.id }"
    else
      render 'new.html.erb'
    end
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  # def update
  #   project = Project.find(params[:id])
  #   project.assign_attributes(
  #     name: params[:name],
  #     user_id: params[:user_id]
  #     )
  #   project.save
  #   flash[:success] = "Product Successfully Updated"
  #   redirect_to "/projects/#{ project.id }"
  # end

  # def destroy
  #   project = Project.find(params[:id])
  #   project.destroy
  #   flash[:success] = "Project Successfully Deleted"
  #   redirect_to "/"
  # end
end

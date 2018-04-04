class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @tasks = Task.all
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(
      name: params[:name],
      user_id: params[:user_id]
      )
    if project.save
      flash[:success] = "Project Successfully Created"
      redirect_to "/projects"
    else
      puts project.errors.inspect
      render 'new.html.erb'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    project.assign_attributes(
      name: params[:name],
      user_id: params[:user_id]
      )
    project.save
    flash[:success] = "Product Successfully Updated"
    redirect_to "/projects/#{ project.id }"
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    flash[:success] = "Project Successfully Deleted"
    redirect_to "/"
  end
end

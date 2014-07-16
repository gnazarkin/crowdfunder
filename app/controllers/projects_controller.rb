class ProjectsController < ApplicationController
  def index
    @projects = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    @project.save
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :end_date)
  end
end

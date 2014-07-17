class ProjectsController < ApplicationController
  before_filter :require_login, only: [:create, :destroy, :update]

  def index
    @projects = Project.all
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

    if @project.save
      redirect_to @project
    else
      render :new
    end
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
    params.require(:project).permit(:name, :description, :end_date, :goal, rewards_attributes: [:amount, :description, :_destroy])
  end
end

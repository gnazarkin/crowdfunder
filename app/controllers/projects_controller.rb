class ProjectsController < ApplicationController
  before_filter :require_login, only: [:create, :destroy, :update]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @rewards = @project.rewards
    commentable = Project.create

    comment = commentable.comments.create
    comment.title = "First comment."
    comment.comment = "This is the first comment."
    comment.save
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
    redirect_to root
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :image, :end_date, :goal, rewards_attributes: [:amount, :description, :_destroy])
  end
end

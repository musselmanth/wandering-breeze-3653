class ContestantProjectsController < ApplicationController
  def new
    @contestant_project = ContestantProject.new
  end

  def create
    @project = Project.find(params[:project_id])
    @project.contestants << Contestant.find(params[:contestant_id])
    redirect_to("/projects/#{params[:project_id]}")
  end

end
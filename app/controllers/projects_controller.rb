class ProjectsController < ApplicationController
  def index
    @tracker_projects = TrackerProject.new.projects
  end

  def show
    @tracker_stories = TrackerProject.new.stories(params[:id])
  end
end
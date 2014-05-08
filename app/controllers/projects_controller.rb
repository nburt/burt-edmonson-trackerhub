class ProjectsController < ApplicationController
  def index
    @tracker_projects = TrackerProject.new.projects
  end

  def show
    @tracker_stories = TrackerProject.new.stories(params[:id])
    @tracker_comments = TrackerProject.new.comments(params[:id])
  end

end
class DashboardController < ApplicationController
  def index
    @tracker_projects = TrackerProject.new.projects
  end
end
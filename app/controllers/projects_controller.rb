class ProjectsController < ApplicationController
  def index
    @tracker_projects = TrackerProject.new.projects
  end

  def show
    @tracker_stories = TrackerProject.new.stories(params[:id])
    @tracker_comments = TrackerProject.new.comments(params[:id])
    github_commits = []
    @tracker_comments.each do |comment|
      if comment['text'].match /commit/
        github_commits << comment
      end
    end
    @github_comments = GithubApi.new(ENV['GITHUB_USERNAME'], ENV['GITHUB_PASSWORD']).comments(github_commits)
  end

end
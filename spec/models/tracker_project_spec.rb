require 'spec_helper'

describe TrackerProject do
  it 'can pull projects from the tracker api' do
    VCR.use_cassette('models/tracker_project_spec/tracker_projects') do
      tracker_project = TrackerProject.new
      tracker_projects = tracker_project.projects
      projects_array = tracker_projects.map { |project| project['name'] }

      expect(projects_array).to include('OneFeed')
      expect(projects_array).to include("Nathanael Burt's Work")
    end
  end

  it 'can pull stories for a tracker project from the api' do
    VCR.use_cassette('models/tracker_project_spec/tracker_stories') do
      tracker_projects = TrackerProject.new
      tracker_stories = tracker_projects.stories(1071248)
      stories_array = tracker_stories.map { |story| story['name'] }

      expect(stories_array).to include('Create homepage')
      expect(stories_array).to include('Can login with Twitter')
    end
  end

  it 'can pull comments for a tracker project from the api' do
    VCR.use_cassette('models/tracker_project_spec/tracker_comments') do
      tracker_stories = TrackerProject.new
      tracker_comments = tracker_stories.comments(1071248)
      comments_array = tracker_comments.map { |comment| comment['text']}

      expect(comments_array).to include('Awesome homepage!')
      expect(comments_array).to include('Agreed!')
      expect(comments_array).to include('Cool Twitter login')
    end
  end
end
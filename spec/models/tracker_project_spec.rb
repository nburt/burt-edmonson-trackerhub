require 'spec_helper'

describe TrackerProject do
  it 'can pull projects from the tracker api' do
    VCR.use_cassette('tracker_projects') do
      tracker_project = TrackerProject.new
      tracker_projects = tracker_project.projects
      projects_array = tracker_projects.map { |project| project['name'] }

      expect(projects_array).to include('OneFeed')
      expect(projects_array).to include("Nathanael Burt's Work")
    end
  end

  it 'can pull stories for a tracker project from the api' do
    VCR.use_cassette('tracker_stories') do
      tracker_projects = TrackerProject.new
      tracker_stories = tracker_projects.stories(1071248)
      stories_array = tracker_stories.map { |story| story['name'] }

      expect(stories_array).to include('Create homepage')
      expect(stories_array).to include('Can login with Twitter')
    end
  end

  it 'can pull comments for a tracker project from the api' do
    VCR.use_cassette('tracker_comments') do
      tracker_stories = TrackerProject.new

      expect(tracker_stories.comments(1071248)).to include('Awesome homepage!')
      expect(tracker_stories.comments(1071248)).to include('Agreed!')
      expect(tracker_stories.comments(1071248)).to include('Cool Twitter login')
    end
  end
end
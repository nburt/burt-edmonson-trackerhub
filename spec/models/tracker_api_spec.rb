require 'spec_helper'

describe TrackerApi do
  it 'can pull projects from the tracker api' do
    tracker_api = TrackerApi.new(ENV['TRACKER_API_TOKEN'])
    response = JSON.parse(tracker_api.results('projects/'))
    response_array = response.map { |project| project['name'] }
    expect(response_array).to include('OneFeed')
    expect(response_array).to include("Nathanael Burt's Work")
  end

  it 'can pull stories for a tracker project from the api' do
    tracker_api = TrackerApi.new(ENV['TRACKER_API_TOKEN'])
    response = JSON.parse(tracker_api.results('projects/1071248/stories'))
    response_array = response.map { |stories| stories['name'] }
    expect(response_array).to include('Create homepage')
    expect(response_array).to include("Can login with Twitter")
  end

  it 'can pull comments for a tracker project from the api' do
    tracker_api = TrackerApi.new(ENV['TRACKER_API_TOKEN'])
    response = JSON.parse(tracker_api.results('projects/1071248/stories/'))
    story_id_array = response.map { |story| story['id'] }
    response_array = []
    story_id_array.each do |id|
      response_array << JSON.parse(tracker_api.results("projects/1071248/stories/#{id}/comments"))
    end
    comment_array = []
    response_array.each do |story|
      comment_array << story.map { |comment| comment['text'] }
    end
    comment_array.flatten!
    expect(comment_array).to include('Awesome homepage!')
    expect(comment_array).to include("Agreed!")
    expect(comment_array).to include("Cool Twitter login")
  end
end
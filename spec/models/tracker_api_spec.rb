require 'spec_helper'

describe TrackerApi do
  it 'can pull projects from the tracker api' do
    tracker_api = TrackerApi.new(ENV['TRACKER_API_TOKEN'])
    response = JSON.parse(tracker_api.get_projects)
    response_array = response.map {|project| project['name']}
    expect(response_array).to include('OneFeed')
    expect(response_array).to include("Nathanael Burt's Work")
  end

  it 'can pull stories for a tracker project from the api' do
    tracker_api = TrackerApi.new(ENV['TRACKER_API_TOKEN'])
    response = JSON.parse(tracker_api.get_stories('1071248'))
    response_array = response.map {|stories| stories['name']}
    expect(response_array).to include('Create homepage')
    expect(response_array).to include("Can login with Twitter")
  end
end
class TrackerProject

def projects
    tracker_api = TrackerApi.new(ENV['TRACKER_API_TOKEN'])
    JSON.parse(tracker_api.results('projects/'))
  end

  def stories(id)
    tracker_api = TrackerApi.new(ENV['TRACKER_API_TOKEN'])
    JSON.parse(tracker_api.results("projects/#{id}/stories"))
  end

end
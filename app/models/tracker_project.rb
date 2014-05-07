class TrackerProject

  def projects
    tracker_api = TrackerApi.new(ENV['TRACKER_API_TOKEN'])
    JSON.parse(tracker_api.get_projects)
  end

  def stories(id)
    tracker_api = TrackerApi.new(ENV['TRACKER_API_TOKEN'])
    JSON.parse(tracker_api.get_stories(id))
  end

end
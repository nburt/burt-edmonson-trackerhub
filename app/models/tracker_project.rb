class TrackerProject

  def projects
    tracker_api = TrackerApi.new(ENV['TRACKER_API_TOKEN'])
    projects = JSON.parse(tracker_api.get_projects)
    projects.map {|project| project["name"]}
  end

end
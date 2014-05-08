class TrackerProject

  def projects
    tracker_api = TrackerApi.new(ENV["TRACKER_API_TOKEN"])
    JSON.parse(tracker_api.results("projects/"))
  end

  def stories(id)
    tracker_api = TrackerApi.new(ENV["TRACKER_API_TOKEN"])
    JSON.parse(tracker_api.results("projects/#{id}/stories"))
  end

  def comments(project_id)
    tracker_api = TrackerApi.new(ENV["TRACKER_API_TOKEN"])
    response = JSON.parse(tracker_api.results("projects/#{project_id}/stories/"))
    story_id_array = response.map { |story| story["id"] }
    response_array = []
    story_id_array.each do |story_id|
      response_array << JSON.parse(tracker_api.results("projects/#{project_id}/stories/#{story_id}/comments/"))
    end
    response_array.flatten!
  end
end
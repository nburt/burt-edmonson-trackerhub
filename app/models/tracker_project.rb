class TrackerProject

  def projects
    tracker_api = TrackerApi.new(ENV["TRACKER_API_TOKEN"])
    JSON.parse(tracker_api.results("projects/"))
  end

  def stories(id)
    tracker_api = TrackerApi.new(ENV["TRACKER_API_TOKEN"])
    JSON.parse(tracker_api.results("projects/#{id}/stories"))
  end

  def comments(id)
    tracker_api = TrackerApi.new(ENV["TRACKER_API_TOKEN"])
    response = JSON.parse(tracker_api.results("projects/#{id}/stories/"))
    story_id_array = response.map { |story| story["id"] }
    response_array = []
    story_id_array.each do |id|
      response_array << JSON.parse(tracker_api.results("projects/1071248/stories/#{id}/comments"))
    end
    comment_array = []
    response_array.each do |story|
      comment_array << story.map { |comment| comment["text"] }
    end
    comment_array.flatten!
  end
end
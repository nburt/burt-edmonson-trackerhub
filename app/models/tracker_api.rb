class TrackerApi
  def initialize(api_token)
    @api_token = api_token
  end

  def get_projects
    connection = Faraday.new("https://www.pivotaltracker.com/services/v5/projects/")
    response = connection.get do |req|
      req.url "https://www.pivotaltracker.com/services/v5/projects/"
      req.headers['X-TrackerToken'] = @api_token
    end
    response.body
  end
end
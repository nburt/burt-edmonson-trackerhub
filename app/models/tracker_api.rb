class TrackerApi
  def initialize(api_token)
    @api_token = api_token
  end

  def results(path)
    connection = Faraday.new("https://www.pivotaltracker.com/services/v5/#{path}")
    response = connection.get do |req|
      req.url "https://www.pivotaltracker.com/services/v5/#{path}"
      req.headers['X-TrackerToken'] = @api_token
    end
    response.body
  end
end
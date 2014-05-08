class GithubApi

  def initialize(username, password)
    @username = username
    @password = password
  end

  def comments(tracker_comments_array)
    github_response_array = []
    tracker_comments_array.each do |comment|
      ref = comment["commit_identifier"]
      owner, repo = comment["text"].scan(/.*https:\/\/github.com\/(.+)\/(.+)\/commit\/.+/).flatten

      github_response_array << github_request(ref, owner, repo)
    end

    github_comments_array = github_response_array.map { |comment_string| JSON.parse(comment_string) }
    github_comments_array.flatten.map {|comment| comment["body"]}
  end

  private

  def github_request(ref, owner, repo)

    connection = Faraday.new("https://api.github.com/repos/#{owner}/#{repo}/commits/#{ref}/comments")
    connection.basic_auth(ENV['GITHUB_USERNAME'], ENV['GITHUB_PASSWORD'])

    response = connection.get do |req|
      req.url "https://api.github.com/repos/#{owner}/#{repo}/commits/#{ref}/comments"
    end

    response.body
  end
end

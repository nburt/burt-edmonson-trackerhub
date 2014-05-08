require 'spec_helper'

describe GithubApi do
  it 'can retrieve GitHub comments associated with a particular tracker story' do
    VCR.use_cassette('models/github_api_spec/github_comments') do
      github_api = GithubApi.new(ENV['GITHUB_USERNAME'], ENV['GITHUB_PASSWORD'])
      actual = github_api.comments([{"kind" => "comment", "id" => 68672130, "story_id" => 70885252, "text" => "Commit by Nathanael Burt\nhttps://github.com/nburt/burt-edmonson-trackerhub/commit/87cae6179107e7a0c220f3f83f23edd58cb54c21\n\n[#70885252] displays the names of tracker projects\n\nSigned-off-by: Kaylee Edmonson <kaylee.edmonson@gmail.com>", "person_id" => 1256928, "created_at" => "2014-05-07T20:27:15Z", "updated_at" => "2014-05-07T20:27:15Z", "commit_identifier" => "87cae6179107e7a0c220f3f83f23edd58cb54c21", "commit_type" => "github"}, {"kind" => "comment", "id" => 68680826, "story_id" => 70885254, "text" => "Commit by Nathanael Burt\nhttps://github.com/nburt/burt-edmonson-trackerhub/commit/130e06ce8ff7da546afc2182cb27a37739f94df1\n\n[#70885254] Refactoring\n\ntracker api class now only has one method that takes the endpoint for the api call\n\nSigned-off-by: Kaylee Edmonson <kaylee.edmonson@gmail.com>", "person_id" => 1256928, "created_at" => "2014-05-07T21:38:44Z", "updated_at" => "2014-05-07T21:38:44Z", "commit_identifier" => "130e06ce8ff7da546afc2182cb27a37739f94df1", "commit_type" => "github"}])
      expect(actual).to eq ["Testing comment functionality", "Testing comment functionality 2"]
    end
  end
end
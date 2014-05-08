require 'spec_helper'


feature 'Veiwing Tracker Stories' do
  scenario 'User can see a list of all tracker projects' do
    VCR.use_cassette('features/tracker_hub_spec/tracker_projects') do
      visit '/'
      click_on 'View Projects'
      expect(page).to have_content ("Burt and Edmonson's TrackerHub")
      expect(page).to have_content ("OneFeed")
    end
  end

  scenario 'User can click project link and see stories' do
    VCR.use_cassette('features/tracker_hub_spec/tracker_stories') do
      visit '/projects'
      click_on 'OneFeed'
      expect(page).to have_content("Create homepage")
      expect(page).to have_content("Can login with Twitter")
    end
  end

  scenario 'User can click project link and see comments' do
    VCR.use_cassette('features/tracker_hub_spec/tracker_comments') do
      visit '/projects'
      click_on 'OneFeed'
      expect(page).to have_content("Awesome homepage!")
      expect(page).to have_content("Agreed!")
      expect(page).to have_content("Cool Twitter login")
    end
  end

  scenario 'User can click project link and will see github comments' do
    VCR.use_cassette('features/tracker_hub_spec/github_comments') do
      visit '/projects'
      click_on "Burt and Edmonson's TrackerHub"
      expect(page).to have_content('Testing comment functionality')
      expect(page).to have_content('Testing comment functionality 2')
    end
  end
end

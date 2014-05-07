require 'spec_helper'


feature 'Veiwing Tracker Stories' do
  scenario 'User can see a list of all tracker projects' do
    visit '/'
    click_on 'View Projects'
    expect(page).to have_content ("Burt and Edmonson's TrackerHub")
    expect(page).to have_content ("OneFeed")
  end

  scenario 'User can click project link and see stories'do
    visit '/projects'
    click_on 'OneFeed'
    expect(page).to have_content("Create homepage")
    expect(page).to have_content("Can login with Twitter")
  end
end

require 'spec_helper'


feature 'Veiwing Tracker Stories' do
  scenario 'User can see a list of all tracker projects' do
    visit '/'
    click_on 'View Projects'
    expect(page).to have_content ("Burt and Edmonson's TrackerHub")
    expect(page).to have_content ("OneFeed")
  end
end


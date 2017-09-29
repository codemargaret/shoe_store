require 'spec_helper'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the store creation path', {:type => :feature} do
  it 'takes the user to a homepage where they can add stores' do
    visit '/'
    fill_in('name', :with => 'Happy Feet')
    click_button('Add Store')
    expect(page).to have_content('Happy Feet')
  end
end

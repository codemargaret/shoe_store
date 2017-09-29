require 'spec_helper'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the store creation path', {:type => :feature} do
  it 'takes the user to a homepage where they can add stores' do
    visit '/'
    fill_in('name', :with => 'Caterpillar Shoes')
    click_button('Add Store')
    expect(page).to have_content('Caterpillar Shoes')
  end
end

describe 'the store update path', {:type => :feature} do
  it 'allows the user to change the name of a store' do
    store = Store.new({:name => 'Caterpillar Shoes'})
    store.save
    visit '/'
    click_link('Caterpillar Shoes')
    click_link('Edit Store Name')
    fill_in('name', :with => 'Centipede Shoes')
    click_button('Update Store')
    expect(page).to have_content('Centipede Shoes')
  end
end

describe 'the store delete path', {:type => :feature} do
  it 'allows a user to delete a store' do
    store = Store.new({:name => 'Caterpillar Shoes'})
    store.save
    visit '/'
    click_link('Caterpillar Shoes')
    click_link('Edit Store Name')
    click_button('Delete Store')
    visit '/'
    expect(page).not_to have_content("Caterpillar Shoes")
  end
end

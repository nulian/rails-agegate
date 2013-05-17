# spec/acceptance/visitors_can_pass_agegate_spec.rb
require 'spec_helper'

describe 'agegate' do
  it 'block < 18 visitors' do
    visit '/'

    select_birthday 1, 'April', (Time.now.year - 10)
    click_button 'Check'

    page.should have_content('Access denied')
  end

  it 'allow > 18 visitors' do
    visit '/'

    select_birthday 1, 'April', (Time.now.year - 30)
    click_button 'Check'
    
    page.should have_content('Access granted')
  end

end
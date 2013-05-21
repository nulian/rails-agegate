# spec/features/crawlers_can_pass_agegate_spec.rb
require 'spec_helper'

describe 'agegate' do

  it 'crawler can pass the agegate' do
    options = page.driver.instance_variable_get("@options")
    options[:headers] = {"HTTP_USER_AGENT" => "Googlebot/2.1 (+http://www.googlebot.com/bot.html)"}
    page.driver.instance_variable_set "@options", options

    visit '/'
    page.should have_content('Access granted')
  end

  it 'normal user has to fill the agegate' do
    options = page.driver.instance_variable_get("@options")
    options[:headers] = {"HTTP_USER_AGENT" => "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1468.0 Safari/537.36"}
    page.driver.instance_variable_set "@options", options

    visit '/'
    page.should have_content('Age gate')
  end

end
require 'rails_helper'

describe 'user registers' do
  it 'should receive an email to activate' do
    visit '/'

    click_link 'Register'

    expect(current_path).to eq('/register')

    attributes = {
                  email:    'real@123.com',
                  name:     'Captain',
                  password: 'password'
                 }

    fill_in 'user[email]',	with: attributes[:email]
    fill_in 'user[name]',	with: attributes[:name]
    fill_in 'user[password]',	with: attributes[:password]
    fill_in 'user[password_confirmation]',	with: attributes[:password]

    expect(ActionMailer::Base.deliveries.count).to eq(0)

    click_button 'Submit'

    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end

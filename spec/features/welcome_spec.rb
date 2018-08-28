require 'rails_helper'

describe 'welcome page' do
  it 'has a register button' do
    visit '/'

    expect(page).to have_content 'Register'

    click_on 'Register'

    expect(current_path).to eq('/register')
  end
end

require 'rails_helper'

describe 'User visits root' do
  context 'clicks register' do
    it 'fills out registeration form and is redirected to dashboard_path' do
      visit root_path

      click

    end
  end
end

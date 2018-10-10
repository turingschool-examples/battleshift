require 'rails_helper'

describe FindUser do 
  it 'exists' do
    find_user = FindUser.new

    expect(find_user).to be_a(FindUser)
  end 
end
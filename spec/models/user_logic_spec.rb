require 'rails_helper'

describe UserLogic do 
  it 'exists' do
    find_user = UserLogic.new

    expect(find_user).to be_a(UserLogic)
  end 
end
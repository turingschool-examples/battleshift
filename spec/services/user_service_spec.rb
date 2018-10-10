require 'rails_helper'

describe UserService do
  it 'exists' do
    user_service = UserService.new
    
    expect(user_service).to be_a(UserService)
  end
  
  it 'returns users' do 
    user_service = UserService.new
    
    user = user_service.get_users.first
    expect(user_service.get_users.count).to eq(2)
    expect(user).to have_key(:name)
    expect(user).to have_key(:email)
  end
end

require 'rails_helper'

describe ResultUser do 
  it 'exists' do
    attributes = {}
    result_user = ResultUser.new(attributes)

    expect(result_user).to be_a(ResultUser)
  end 
  
  it 'has attributes' do
    attributes = {name: 'Rajaa', email: 'email'}
    
    result_user = ResultUser.new(attributes)
    
    expect(result_user.name).to eq('Rajaa')
    expect(result_user.email).to eq('email')
  end
end
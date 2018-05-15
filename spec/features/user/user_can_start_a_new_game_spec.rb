require 'rails_helper'

describe 'as player 1' do
  context 'send a request to player 2' do
    it 'creates a game' do
      user = create(:activated_user)
      user = create(:activated_user_2)

      conn.post do |req|
        req.url '/nigiri'
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = "#{activated_user_2.api_key}"
        req.body = '{ "email": "foo2#{n}@foo.com" }'
      end

      binding.pry
      #test that both are in the system
    end
  end
end

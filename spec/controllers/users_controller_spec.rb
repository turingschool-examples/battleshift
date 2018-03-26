require 'rails_helper'

describe UsersController do
  context 'create' do
    it 'sends an email to activate account' do
      user_params = {name: 'Jane123', email: 'Jane@gmail.com', password: 'Test1', password_confirmation: 'Test1'}
      post 'create', params: {user: user_params}
      expect(ActionMailer::Base.deliveries.size).to eq(1)

      activation_email = ActionMailer::Base.deliveries.last

      expect(activation_email.subject).to eq('Activate Account')
      expect(activation_email.to[0]).to eq('Jane@gmail.com')
    end
  end
end

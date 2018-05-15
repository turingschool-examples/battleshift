require "rails_helper"

describe UserMailer do
  describe 'Activation Request Email' do
    it 'should send an activation request through email' do
      user = create(:user)

      UserMailer.with(user: user).activation_request(user).deliver_now
      email = ActionMailer::Base.deliveries.last
      
      expect(email.html_part.body.to_s).to include('Here is your API Key:')
      expect(email.html_part.body.to_s).to include("#{user.api_key}")
      expect(email.html_part.body.to_s).to include('Visit here to activate your account:')
    end
  end
end

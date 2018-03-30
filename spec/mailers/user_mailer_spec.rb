require 'rails_helper'

describe UserMailer, type: :mailer do
  it "Sends welcome email to user" do
    ActionMailer::Base.deliveries.should be_empty

    user = create(:user)
    api_key = create(:api_key, user: user)
    UserMailer.welcome_email(user).deliver

    ActionMailer::Base.deliveries.should_not be_empty
  end
end

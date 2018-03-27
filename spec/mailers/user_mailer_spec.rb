require 'rails_helper'

describe UserMailer, type: :mailer do
  it "Sends welcome email to user" do
    ActionMailer::Base.deliveries.should be_empty

    user = create(:user)
    UserMailer.welcome_email(user).deliver

    ActionMailer::Base.deliveries.should_not be_empty
  end
end

require 'rails_helper'

describe ActivationMailer, type: :mailer do
  it "Sends activation email to user" do
    ActionMailer::Base.deliveries.should be_empty

    user = create(:user)
    activation_key = create(:activation_key, user: user)
    ActivationMailer.activation_email(user).deliver

    ActionMailer::Base.deliveries.should_not be_empty
  end
end

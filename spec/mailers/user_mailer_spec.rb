require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  it "invite user to join the site" do
    ActionMailer::Base.deliveries.should be_empty

    user = create(:user)
    UserMailer.welcome_email(user).deliver
    ActionMailer::Base.deliveries.should_not be_empty
  end
end

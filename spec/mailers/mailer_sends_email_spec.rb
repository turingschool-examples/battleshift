require 'rails_helper'

describe User do
  let(:user){ create(:user) }
  it "sends an email" do
    expect { user.send_email(user, "http://localhost:3000") }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
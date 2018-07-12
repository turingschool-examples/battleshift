require 'rails_helper'

describe User do
  let(:user){ create(:user) }
  it "sends an email" do
    expect { BattleshipNotifierMailer.welcome(user, "http://localhost:3000").deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
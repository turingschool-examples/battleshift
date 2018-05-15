require "rails_helper"

RSpec.describe UserActivatorMailer, type: :mailer do
  it "sends an email" do
    # Create the email and store it for further assertions
    user = User.create(name: 'Megan', email: 'kewlkid@hotmail.com', password: 'gIrLsRuLeBoYsDrOOl')
    email = UserActivatorMailer.welcome_email(user)
    # Send the email, then test that it got queued
    email.deliver_now


    expect(ActionMailer::Base.deliveries.last).to eq(email)

    # Test the body of the sent email contains what we expect it to

    expect(email.from).to eq(["app96560814@heroku.com"])
    expect(email.to).to eq(['kewlkid@hotmail.com'])
    expect(email.subject).to eq('Welcome to BattleShift, Megan')
    # assert_equal read_fixture('invite').join, email.body.to_s
  end
end

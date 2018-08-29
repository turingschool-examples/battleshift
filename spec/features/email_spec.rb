require 'rails_helper'


describe UserActivationMailer do
  it 'should receive an email to activate' do
    skip
    user = create(:user)

    expect { UserActivationMailer.user_activation(user).deliver_now }
      .to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end

=begin

it 'sends an email' do
  expect { subject.send_instructions }
    .to change { ActionMailer::Base.deliveries.count }.by(1)
end

class UsersControllerTest < ActionDispatch::IntegrationTest
test "invite friend" do
assert_difference 'ActionMailer::Base.deliveries.size', +1 do
post invite_friend_url, params: { email: 'friend@example.com' }
end
invite_email = ActionMailer::Base.deliveries.last

assert_equal "You have been invited by me@example.com", invite_email.subject
assert_equal 'friend@example.com', invite_email.to[0]
assert_match(/Hi friend@example\.com/, invite_email.body.to_s)
end
end
=end

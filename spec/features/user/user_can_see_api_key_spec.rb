require 'rails_helper'

feature 'API Key' do
  scenario 'user receives API key in email - html' do
    user = create(:user)

    UserMailer.with(user: user).activation_request(user).deliver_now

    email = ActionMailer::Base.deliveries.last

    expect(email.to).to eq([user.email])

    expect(email.subject).to eq('BattleShift Registration Confirmation')
    expect(email.html_part.body.to_s).to have_content('Visit here to activate your account')
    expect(email.html_part.body.to_s).to have_content('your API Key')
    expect(email.html_part.body.to_s).to have_content("#{user.api_key}")
  end

  scenario 'user receives API key in email - text' do
    user = create(:user)

    UserMailer.with(user: user).activation_request(user).deliver_now

    email = ActionMailer::Base.deliveries.last

    expect(email.to).to eq([user.email])
    expect(email.subject).to eq('BattleShift Registration Confirmation')
    expect(email.text_part.body.to_s).to have_content('Visit here to activate your account')
    expect(email.text_part.body.to_s).to have_content('your API Key')
    expect(email.text_part.body.to_s).to have_content("#{user.api_key}")
  end
end

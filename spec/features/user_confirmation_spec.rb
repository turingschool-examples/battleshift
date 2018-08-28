require "rails_helper"

describe "an unregistered user" do
  it "goes to confirmation link" do
    user = create(:user)

    expect(user.status).to eq("inactive")

    visit api_v1_user_confirmation_path(user)

    expect(current_path).to eq(api_v1_user_confirmed_path(user))

    user.reload

    expect(page).to have_content("Thank you! Your account is now activated.")
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path


    expect(user.reload.status).to eq("active")
  end
end

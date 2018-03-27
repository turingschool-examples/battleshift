require "rails_helper"

describe "as unactivated user" do
  it "displays inactive status" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Status: inactive")
  end

  it "allows user to activate account" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit activation_path(user)

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Thank you! Your account is now activated.")
    expect(page).to have_content("Status: active")
  end
end

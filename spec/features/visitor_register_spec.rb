require "rails_helper"

describe "a visitor" do
  context "visits /" do
    it "clicks on register" do
      visit root_path

      expect(page).to have_content("Register")

      click_on "Register"

      expect(current_path).to eq(register_path)
    end

    it "fills in email address, name, password, and password confirmation and clicks submit" do
      visit register_path

      email = "fake@fake.com"
      name = "Fakety fake fake"
      password = "1234"

      fill_in :user_email_address, with: email
      fill_in :user_name, with: name
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      expect(current_path).to eq(dashboard_path(User.last))

      expect(page).to have_content("Logged in as #{name}")
      expect(page).to have_content("This account has not yet been activated. Please check your email.")
    end
  end
end

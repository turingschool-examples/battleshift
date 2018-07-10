require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(first_name: 'Bob', last_name: 'Smith', username: 'New@gmail.com', password_digest: 'password'))
  end

  it "renders attributes in <p>" do
    assign(:current_user, @user)
    render

    assert_select "p", text: "#{@user.first_name}"
  end
end

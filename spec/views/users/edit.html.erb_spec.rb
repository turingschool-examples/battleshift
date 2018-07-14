require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(first_name: 'Bob', last_name: 'Smith', username: 'New@gmail.com', password_digest: 'password'))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input[type=text][name=?]", 'user[first_name]'
      assert_select "input[type=text][name=?]", 'user[last_name]'
      assert_select "input[type=text][name=?]", 'user[username]'
      assert_select "input[type=password][name=?]", 'user[password]'
    end
  end
end

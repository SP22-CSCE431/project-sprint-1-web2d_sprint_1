require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      username: "MyString",
      password: "MyString",
      email: "MyString",
      isAdmin: false,
      role: "MyString",
      bio: "MyString",
      portfolioID: ""
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[isAdmin]"

      assert_select "input[name=?]", "user[role]"

      assert_select "input[name=?]", "user[bio]"

      assert_select "input[name=?]", "user[portfolioID]"
    end
  end
end

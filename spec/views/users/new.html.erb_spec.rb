require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      username: "MyString",
      email: "MyString",
      isAdmin: false,
      role: "MyString",
      bio: "MyString",
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[isAdmin]"

      assert_select "input[name=?]", "user[role]"

      assert_select "input[name=?]", "user[bio]"
    end
  end
end

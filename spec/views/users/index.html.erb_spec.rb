require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        username: "Username",
        email: "Email",
        isAdmin: false,
        role: "Role",
        bio: "Bio",
      ),
      User.create!(
        username: "Username",
        email: "Email",
        isAdmin: false,
        role: "Role",
        bio: "Bio",
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Username".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "Role".to_s, count: 2
    assert_select "tr>td", text: "Bio".to_s, count: 2
  end
end

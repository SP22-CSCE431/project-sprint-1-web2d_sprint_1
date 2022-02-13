require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      username: "Username",
      email: "Email",
      isAdmin: false,
      role: "Role",
      bio: "Bio",
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Bio/)
  end
end

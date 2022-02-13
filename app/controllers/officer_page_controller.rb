class OfficerPageController < ApplicationController
  def officers
    @users = User.officers
  end
end

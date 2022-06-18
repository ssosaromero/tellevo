class PagesController < ApplicationController
  def home
  end

  def my_profile
    @user = current_user
  end
end

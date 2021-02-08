class UsersController < ApplicationController
  def show
    @user = current
  end
end

class UsersController < ApplicationController
def create
@user = User.new(params[:user])
@user.save
respond_to do |format|
  format.html
  format.json{render @user.to_json}
end
end
end

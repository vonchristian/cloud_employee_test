class UsersController < ApplicationController
  def index
    @users = User.all.active
    respond_to :html, :json
  end

  def destroy
    user = User.find(params[:id])
    Users::Delete.run(user: user)

    respond_to do |format|
      format.html { redirect_to users_path }
    end
  end
end

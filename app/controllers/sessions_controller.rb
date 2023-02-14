class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path, notice: 'You have been logged out.'
  end
end

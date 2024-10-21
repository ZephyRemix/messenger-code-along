class HangoutsController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.includes(:user)
    # @messages = Message.all --> introduces N+1 problem, since we need to access the user from message for each record
  end
end

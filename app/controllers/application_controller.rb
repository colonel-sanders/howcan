require 'whocan'

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :whocan

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def whocan
    WhoCan.reset_stack
  end
end

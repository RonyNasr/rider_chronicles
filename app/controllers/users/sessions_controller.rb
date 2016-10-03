class Users::SessionsController < Devise::SessionsController

  def create
    auth_options={:recall => 'page#home', :scope => :user}
    resource = warden.authenticate!(auth_options)
  end

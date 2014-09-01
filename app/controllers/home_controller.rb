class HomeController < ApplicationController
  layout 'temp', :only => [:error]
  def index
    @users = User.all
  end
  def error
  end
end

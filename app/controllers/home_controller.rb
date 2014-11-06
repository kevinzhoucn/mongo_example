class HomeController < ApplicationController
  layout 'temp', :only => [:error]
  def index
    @users = User.all
  end
  def error
  end
  def world
    HardWorker.perform_async('bob', 5)
  end
end

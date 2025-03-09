class HomeController < ApplicationController
  before_action :authenticate_person!, except: [:index]
  
  def index
    @person = current_person
  end
end

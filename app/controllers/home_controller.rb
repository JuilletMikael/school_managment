class HomeController < ApplicationController
  def index
    @person = current_person
  end
end

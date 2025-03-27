class ProfilesController < ApplicationController
  before_action :authenticate_person!

  def show
    @person = current_person
  end
end 
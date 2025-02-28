class PersonStatusesController < ApplicationController
  before_action :set_person_status, only: %i[ show edit update destroy ]

  # GET /person_statuses or /person_statuses.json
  def index
    @person_statuses = PersonStatus.all
  end

  # GET /person_statuses/1 or /person_statuses/1.json
  def show
  end

  # GET /person_statuses/new
  def new
    @person_status = PersonStatus.new
  end

  # GET /person_statuses/1/edit
  def edit
  end

  # POST /person_statuses or /person_statuses.json
  def create
    @person_status = PersonStatus.new(person_status_params)

    respond_to do |format|
      if @person_status.save
        format.html { redirect_to @person_status, notice: "Person status was successfully created." }
        format.json { render :show, status: :created, location: @person_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_statuses/1 or /person_statuses/1.json
  def update
    respond_to do |format|
      if @person_status.update(person_status_params)
        format.html { redirect_to @person_status, notice: "Person status was successfully updated." }
        format.json { render :show, status: :ok, location: @person_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_statuses/1 or /person_statuses/1.json
  def destroy
    @person_status.destroy!

    respond_to do |format|
      format.html { redirect_to person_statuses_path, status: :see_other, notice: "Person status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_status
      @person_status = PersonStatus.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def person_status_params
      params.expect(person_status: [ :status ])
    end
end

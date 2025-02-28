class DeansController < ApplicationController
  before_action :set_dean, only: %i[ show edit update destroy ]

  # GET /deans or /deans.json
  def index
    @deans = Dean.all
  end

  # GET /deans/1 or /deans/1.json
  def show
  end

  # GET /deans/new
  def new
    @dean = Dean.new
  end

  # GET /deans/1/edit
  def edit
  end

  # POST /deans or /deans.json
  def create
    @dean = Dean.new(dean_params)

    respond_to do |format|
      if @dean.save
        format.html { redirect_to @dean, notice: "Dean was successfully created." }
        format.json { render :show, status: :created, location: @dean }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dean.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deans/1 or /deans/1.json
  def update
    respond_to do |format|
      if @dean.update(dean_params)
        format.html { redirect_to @dean, notice: "Dean was successfully updated." }
        format.json { render :show, status: :ok, location: @dean }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dean.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deans/1 or /deans/1.json
  def destroy
    @dean.destroy!

    respond_to do |format|
      format.html { redirect_to deans_path, status: :see_other, notice: "Dean was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dean
      @dean = Dean.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def dean_params
      params.expect(dean: [ :username, :lastname, :firstname, :email, :phone_number, :address_id, :person_status_id, :type, :iban ])
    end
end

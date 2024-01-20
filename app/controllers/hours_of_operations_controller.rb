class HoursOfOperationsController < ApplicationController
  before_action :set_hours_of_operation, only: %i[ show edit update destroy ]

  # GET /hours_of_operations or /hours_of_operations.json
  def index
    @hours_of_operations = HoursOfOperation.all
  end

  # GET /hours_of_operations/1 or /hours_of_operations/1.json
  def show
  end

  # GET /hours_of_operations/new
  def new
    @hours_of_operation = HoursOfOperation.new
  end

  # GET /hours_of_operations/1/edit
  def edit
  end

  # POST /hours_of_operations or /hours_of_operations.json
  def create
    @hours_of_operation = HoursOfOperation.new(hours_of_operation_params)

    respond_to do |format|
      if @hours_of_operation.save
        format.html { redirect_to hours_of_operation_url(@hours_of_operation), notice: "Hours of operation was successfully created." }
        format.json { render :show, status: :created, location: @hours_of_operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hours_of_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hours_of_operations/1 or /hours_of_operations/1.json
  def update
    respond_to do |format|
      if @hours_of_operation.update(hours_of_operation_params)
        format.html { redirect_to hours_of_operation_url(@hours_of_operation), notice: "Hours of operation was successfully updated." }
        format.json { render :show, status: :ok, location: @hours_of_operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hours_of_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hours_of_operations/1 or /hours_of_operations/1.json
  def destroy
    @hours_of_operation.destroy!

    respond_to do |format|
      format.html { redirect_to hours_of_operations_url, notice: "Hours of operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hours_of_operation
      @hours_of_operation = HoursOfOperation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hours_of_operation_params
      params.require(:hours_of_operation).permit(:restaurant_id, :day, :openTime1, :closeTime1, :openTime2, :closeTime2)
    end
end

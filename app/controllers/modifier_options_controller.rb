class ModifierOptionsController < ApplicationController
  before_action :set_modifier_option, only: %i[ show edit update destroy ]

  # GET /modifier_options or /modifier_options.json
  def index
    @modifier_options = ModifierOption.all
  end

  # GET /modifier_options/1 or /modifier_options/1.json
  def show
  end

  # GET /modifier_options/new
  def new
    @modifier_option = ModifierOption.new
  end

  # GET /modifier_options/1/edit
  def edit
  end

  # POST /modifier_options or /modifier_options.json
  def create
    @modifier_option = ModifierOption.new(modifier_option_params)

    respond_to do |format|
      if @modifier_option.save
        format.html { redirect_to modifier_option_url(@modifier_option), notice: "Modifier option was successfully created." }
        format.json { render :show, status: :created, location: @modifier_option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @modifier_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modifier_options/1 or /modifier_options/1.json
  def update
    respond_to do |format|
      if @modifier_option.update(modifier_option_params)
        format.html { redirect_to modifier_option_url(@modifier_option), notice: "Modifier option was successfully updated." }
        format.json { render :show, status: :ok, location: @modifier_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @modifier_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modifier_options/1 or /modifier_options/1.json
  def destroy
    @modifier_option.destroy!

    respond_to do |format|
      format.html { redirect_to modifier_options_url, notice: "Modifier option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modifier_option
      @modifier_option = ModifierOption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def modifier_option_params
      params.require(:modifier_option).permit(:modifier_id, :name, :additional_price)
    end
end

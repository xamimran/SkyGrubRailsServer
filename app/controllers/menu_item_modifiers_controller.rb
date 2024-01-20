class MenuItemModifiersController < ApplicationController
  before_action :set_menu_item_modifier, only: %i[ show edit update destroy ]

  # GET /menu_item_modifiers or /menu_item_modifiers.json
  def index
    @menu_item_modifiers = MenuItemModifier.all
  end

  # GET /menu_item_modifiers/1 or /menu_item_modifiers/1.json
  def show
  end

  # GET /menu_item_modifiers/new
  def new
    @menu_item_modifier = MenuItemModifier.new
  end

  # GET /menu_item_modifiers/1/edit
  def edit
  end

  # POST /menu_item_modifiers or /menu_item_modifiers.json
  def create
    @menu_item_modifier = MenuItemModifier.new(menu_item_modifier_params)

    respond_to do |format|
      if @menu_item_modifier.save
        format.html { redirect_to menu_item_modifier_url(@menu_item_modifier), notice: "Menu item modifier was successfully created." }
        format.json { render :show, status: :created, location: @menu_item_modifier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_item_modifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_item_modifiers/1 or /menu_item_modifiers/1.json
  def update
    respond_to do |format|
      if @menu_item_modifier.update(menu_item_modifier_params)
        format.html { redirect_to menu_item_modifier_url(@menu_item_modifier), notice: "Menu item modifier was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_item_modifier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_item_modifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_item_modifiers/1 or /menu_item_modifiers/1.json
  def destroy
    @menu_item_modifier.destroy!

    respond_to do |format|
      format.html { redirect_to menu_item_modifiers_url, notice: "Menu item modifier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item_modifier
      @menu_item_modifier = MenuItemModifier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_item_modifier_params
      params.require(:menu_item_modifier).permit(:menu_item_id, :modifier_id, :primary)
    end
end

class OrderItemModifiersController < ApplicationController
  before_action :set_order_item_modifier, only: %i[ show edit update destroy ]

  # GET /order_item_modifiers or /order_item_modifiers.json
  def index
    @order_item_modifiers = OrderItemModifier.all
  end

  # GET /order_item_modifiers/1 or /order_item_modifiers/1.json
  def show
  end

  # GET /order_item_modifiers/new
  def new
    @order_item_modifier = OrderItemModifier.new
  end

  # GET /order_item_modifiers/1/edit
  def edit
  end

  # POST /order_item_modifiers or /order_item_modifiers.json
  def create
    @order_item_modifier = OrderItemModifier.new(order_item_modifier_params)

    respond_to do |format|
      if @order_item_modifier.save
        format.html { redirect_to order_item_modifier_url(@order_item_modifier), notice: "Order item modifier was successfully created." }
        format.json { render :show, status: :created, location: @order_item_modifier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item_modifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_item_modifiers/1 or /order_item_modifiers/1.json
  def update
    respond_to do |format|
      if @order_item_modifier.update(order_item_modifier_params)
        format.html { redirect_to order_item_modifier_url(@order_item_modifier), notice: "Order item modifier was successfully updated." }
        format.json { render :show, status: :ok, location: @order_item_modifier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_item_modifier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_item_modifiers/1 or /order_item_modifiers/1.json
  def destroy
    @order_item_modifier.destroy!

    respond_to do |format|
      format.html { redirect_to order_item_modifiers_url, notice: "Order item modifier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item_modifier
      @order_item_modifier = OrderItemModifier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_modifier_params
      params.require(:order_item_modifier).permit(:order_item_id, :modifier_option_id)
    end
end

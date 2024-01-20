class ItemPricesController < ApplicationController
  before_action :set_item_price, only: %i[ show edit update destroy ]

  # GET /item_prices or /item_prices.json
  def index
    @item_prices = ItemPrice.all
  end

  # GET /item_prices/1 or /item_prices/1.json
  def show
  end

  # GET /item_prices/new
  def new
    @item_price = ItemPrice.new
  end

  # GET /item_prices/1/edit
  def edit
  end

  # POST /item_prices or /item_prices.json
  def create
    @item_price = ItemPrice.new(item_price_params)

    respond_to do |format|
      if @item_price.save
        format.html { redirect_to item_price_url(@item_price), notice: "Item price was successfully created." }
        format.json { render :show, status: :created, location: @item_price }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_prices/1 or /item_prices/1.json
  def update
    respond_to do |format|
      if @item_price.update(item_price_params)
        format.html { redirect_to item_price_url(@item_price), notice: "Item price was successfully updated." }
        format.json { render :show, status: :ok, location: @item_price }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_prices/1 or /item_prices/1.json
  def destroy
    @item_price.destroy!

    respond_to do |format|
      format.html { redirect_to item_prices_url, notice: "Item price was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_price
      @item_price = ItemPrice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_price_params
      params.require(:item_price).permit(:item_id, :base_price)
    end
end

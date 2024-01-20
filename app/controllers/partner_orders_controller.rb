class PartnerOrdersController < ApplicationController

  # GET /partner_orders
  def index
    @partner_orders = PartnerOrder.all
  end

  # GET /partner_orders/:id
  def show
    @partner_order = PartnerOrder.find(params[:id])
    @partner_order = PartnerOrder.includes(:order).find(params[:id])
  end

  # GET /partner_orders/new
  def new
    @partner_order = PartnerOrder.new
  end

  # POST /partner_orders
  def create
    @partner_order = PartnerOrder.new(partner_order_params)
    if @partner_order.save
      redirect_to @partner_order, notice: 'Partner order was successfully created.'
    else
      render :new
    end
  end

  # GET /partner_orders/:id/edit
  def edit
    @partner_order = PartnerOrder.find(params[:id])
  end

  # PATCH/PUT /partner_orders/:id
  def update
    @partner_order = PartnerOrder.find(params[:id])

    if @partner_order.update(partner_order_params)
      redirect_to @partner_order, notice: 'Partner order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /partner_orders/:id
  def destroy
    @partner_order = PartnerOrder.find(params[:id])
    @partner_order.destroy

    redirect_to partner_orders_url, notice: 'Partner order was successfully destroyed.'
  end

  private

  def partner_order_params
    params.require(:partner_order).permit(:partner_id, :order_id, :customer_review, :partner_status, :assigned_at, :responded_at, :pickup_at, :delivered_at, :notification_sent_at, :notification_response_due_by)
  end

end

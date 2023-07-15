class UserLotsController < ApplicationController
  def index; end

  def new
    @lot = Lot.new
  end

  def create
    lot = Lot.new(lot_params)
    lot.current_amount = lot_params[:kg_received]
    lot.user_id = Current.user.id
    lot.status = 1
    if lot.save
      redirect_to user_lots_path(Current.user)
    else
      render :new
    end
  end

  def mark_arrived
    lot = Lot.find(params[:lot_id])
    lot.status = 2
    lot.save
    redirect_to user_lots_path
  end

  def mark_removed
    lot = Lot.find(params[:lot_id])
    lot.status = 3
    lot.save
    redirect_to user_lots_path
  end

  def detailed
    @inventory = Current.user.lots
  end

  def edit 
   @lot = Lot.find(params[:id])
  end

  def update 
    lot = Lot.find(params[:lot_id])
    lot.update(lot_params)
    redirect_to user_lots_path
  end

  # download csv from User.lots
  def download_csv
    @lots = Current.user.lots
    respond_to do |format|
      format.html
      format.csv { send_data @lots.to_csv, filename: "lots-#{Date.today}.csv" }
    end
  end
  

  private

  def lot_params
    params.require(:lot).permit(:name, :sku, :importer, :description, :us_arrival, :price_per, :sample_roasted_date,
                                :density, :moisture, :bean_size, :item_size, :quantity_recieved, :kg_received, :invoice_number, :pcc_id, :ico)
  end
end

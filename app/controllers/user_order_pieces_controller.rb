class UserOrderPiecesController < ApplicationController
    


  def create
    @order_piece = OrderPiece.new(order_piece_params)
    @order_piece.order_request = OrderRequest.find(params[:order_request_id])
    if @order_piece.save
      redirect_to user_order_request_path(Current.user, @order_piece.order_request)
    else
      render :new
    end
  end

  def destroy
    @order_piece = OrderPiece.find(params[:id])
    @order_piece.destroy
    redirect_to user_order_request_path(Current.user, @order_piece.order_request)
  end

  private

  def order_piece_params
    params.require(:order_piece).permit(:quantity, :coffee_name, :size, :ground)
  end
end

class UserOrderRequestsController < ApplicationController

    def index 
        @pending_order_requests = Current.user.order_requests.pending
    end

    def new
        @order_request = OrderRequest.new
    end


    def create
        
        @order_request = Current.user.order_requests.build(order_request_params)
        if @order_request.save
            redirect_to user_order_request_path(Current.user, @order_request)
        else
            render :new
        end
    end

    def show 
        @order_request = OrderRequest.find(params[:id])
        @order_piece = OrderPiece.new
    end

  def mark_completed    
    @order_request = OrderRequest.find(params[:order_request_id])
    @order_request.update(status: 1)
    redirect_to user_order_requests_path(Current.user)
    end

    def mark_paid 
        @order_request = OrderRequest.find(params[:order_request_id])
        @order_request.update(status: 2)
        redirect_to  user_completed_orders_path(Current.user)
    end

    def delete 
        @order_request = OrderRequest.find(params[:order_request_id])
        @order_request.destroy
        redirect_to user_order_requests_path(Current.user)
    end

    def completed
        @completed_order_requests = Current.user.order_requests.completed.reverse
    end

    def paid
        @paid_order_requests = Current.user.order_requests.paid.reverse
    end
  


    private

    def order_request_params
        params.require(:order_request).permit(:employee_name, :recipient_name, :reason, :need_by_date, :invoice_number)
    end
end

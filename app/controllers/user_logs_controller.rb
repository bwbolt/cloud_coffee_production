class UserLogsController < ApplicationController
  def index
    # code
  end

  def new
    @log = Log.new
  end

  def create
    if params[:log][:lot]
      log = Log.new(log_params)
      log.total_roasted = log.batches * log.batch_size_kg
      lot = Lot.find_by(name: params[:log][:lot])
      lot.current_amount = lot.current_amount - log.total_roasted
      lot.save
      log.lot_id = lot.id
      if log.save
        redirect_to new_user_log_path(Current.user)
      else
        render :new
      end
    else
      flash[:alert] = 'Hey you forgot to choose a lot to roast from!'
      redirect_to new_user_log_path(Current.user)
    end
  end

  def weight_out
    log = Log.find(params[:log_id])
    log.weight_out = params[:weight_out]
    log.moisture_loss = 1 - (params[:weight_out].to_f/log.batch_size_kg)
    log.save
    if params[:hidden]
      redirect_to new_user_log_path(Current.user)
    else
      redirect_to user_logs_path(Current.user)
    end
  end

  #download csv from User.logs
  def download_csv
    @logs = Current.user.logs
    respond_to do |format|
      format.html
      format.csv { send_data @logs.to_csv, filename: "logs-#{Date.today}.csv" }
    end
  end

  def destroy
    puts(params)

    log = Log.find(params[:log_id])
    lot = log.lot
  
    # Restore the roasted amount to the lot's current amount
    lot.current_amount += log.total_roasted
    lot.save
  
    # Delete the log entry
    log.destroy 
  
    redirect_to user_logs_path(Current.user)
  end

  private

  def log_params
    params.require(:log).permit(:batches, :batch_size_kg)
    # code
  end
end

class BlendsController < ApplicationController
  before_action :set_blend, only: %i[ show edit update destroy ]

  # GET /blends or /blends.json
  def index
    @blends = Blend.all
  end

  # GET /blends/1 or /blends/1.json
  def show
  end

  # GET /blends/new
  def new
    @blend = Blend.new
  end

  # GET /blends/1/edit
  def edit
  end

  # POST /blends or /blends.json
  def create


    @blend = Blend.new(blend_params)
    @blend.user_id = Current.user.id

   @blend.save
     
   blend_log_params =  params[:blend][:logs].drop(1)

   blend_log_params.each do |log|
      @blend_log = BlendLog.new()
      @blend_log.blend_id = @blend.id 
      @blend_log.log_id = log.to_i

      @blend_log.save
    end

    redirect_to new_blend_path, notice: "Blend was successfully Created."
    
  end

  # PATCH/PUT /blends/1 or /blends/1.json
  def update
    respond_to do |format|
      if @blend.update(blend_params)
        format.html { redirect_to blend_url(@blend), notice: "Blend was successfully updated." }
        format.json { render :show, status: :ok, location: @blend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blends/1 or /blends/1.json
  def destroy
    @blend = Blend.find(params[:id])
    @blend.blend_logs.destroy_all
  

    @blend.destroy

    respond_to do |format|
      format.html { redirect_to blends_url, notice: "Blend was successfully destroyed." }
      format.json { head :no_content }
    end
  end


    #download csv from User.blends
    def download_csv
      @blends = Current.user.blends
      respond_to do |format|
        format.html
        format.csv { send_data @blends.to_csv, filename: "blends-#{Date.today}.csv" }
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blend
      @blend = Blend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blend_params
      params.require(:blend).permit(:name, :notes, :user_id, :logs)
    end
end

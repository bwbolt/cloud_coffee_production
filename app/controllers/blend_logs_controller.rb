class BlendLogsController < ApplicationController
  before_action :set_blend_log, only: %i[ show edit update destroy ]

  # GET /blend_logs or /blend_logs.json
  def index
    @blend_logs = BlendLog.all
  end

  # GET /blend_logs/1 or /blend_logs/1.json
  def show
  end

  # GET /blend_logs/new
  def new
    @blend_log = BlendLog.new
  end

  # GET /blend_logs/1/edit
  def edit
  end

  # POST /blend_logs or /blend_logs.json
  def create
    @blend_log = BlendLog.new(blend_log_params)

    respond_to do |format|
      if @blend_log.save
        format.html { redirect_to blend_log_url(@blend_log), notice: "Blend log was successfully created." }
        format.json { render :show, status: :created, location: @blend_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blend_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blend_logs/1 or /blend_logs/1.json
  def update
    respond_to do |format|
      if @blend_log.update(blend_log_params)
        format.html { redirect_to blend_log_url(@blend_log), notice: "Blend log was successfully updated." }
        format.json { render :show, status: :ok, location: @blend_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blend_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blend_logs/1 or /blend_logs/1.json
  def destroy
    @blend_log.destroy

    respond_to do |format|
      format.html { redirect_to blend_logs_url, notice: "Blend log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blend_log
      @blend_log = BlendLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blend_log_params
      params.require(:blend_log).permit(:blend_id, :log_id)
    end
end

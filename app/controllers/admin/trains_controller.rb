class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  # GET /trains
  def index
    @trains = Train.all
  end

  # GET /trains/1
  def show
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains
  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to [:admin, @train], notice: 'Train was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /trains/1
  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to admin_trains_path, notice: 'Train was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /trains/1
  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to admin_trains_url, notice: 'Train was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_params
      params.require(:train).permit(:number, :wagons_sort, :route_id)
    end
end
